help: ## Usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: init
init:	## set up
	echo 'set up @@'

.PHONY: build
build:  ## docker build
	docker-compose build

.PHONY: install
install:    ## copy env & ruby js install & create db
	cp dotenv.dist .env
	docker-compose run --rm web bin/bundle install
#	docker-compose run --rm web yarn
	docker-compose run --rm web bin/rails db:create

.PHONY: reset-db
reset-db:		## reset DB
	docker-compose run --rm web bin/rails db:drop:all db:create:all RAILS_ENV=development
	docker-compose run --rm web bin/rails db:migrate RAILS_ENV=development
	docker-compose run --rm web bin/rails db:seed RAILS_ENV=development

.PHONY: run
run:    ## docker run
	rm -rf tmp/pids/server.pid
	docker-compose run --rm --service-ports web

.PHONY: lint
lint:   ## run robocop lint
	docker-compose run --rm web rubocop

.PHONY: test
test:   ## lint & test
	make lint
	docker-compose run --rm web bin/rails test
	docker-compose run --rm web yarn test

.PHONY: annotate
annotate: ## schemaをmodelに書き出し
	docker-compose run --rm web bin/bundle exec annotate

.PHONY: debug
debug: ## debug 情報を羅列する
	docker-compose run --rm web ruby -v
	docker-compose run --rm web bin/rails -v
	docker-compose run --rm web bin/bundle -v
	docker-compose run --rm web bin/bundle list
