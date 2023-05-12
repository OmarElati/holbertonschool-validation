build: ## Build the website using Go-Hugo
	hugo --source ./ --destination ./dist/

clean: ## Clean the dist directory
	rm -rf ./dist/*

post: ## Create a new blog post with randomly generated values
	hugo new posts/$(POST_NAME).md
	echo "---\ntitle: $(POST_TITLE)\ndate: $$(date +"%Y-%m-%dT%H:%M:%S")\ndraft: false\n---\n" >> ./content/posts/$(POST_NAME).md

help: ## Show the list of targets and their usage
	@echo "Usage: make [target]"
	@echo "Targets:"
	@awk -F '[:#]' '/^[a-zA-Z_-]+:.*?##/ { printf "\033[36m%-15s\033[0m %s\n", $$1, $$3 }' $(MAKEFILE_LIST)
