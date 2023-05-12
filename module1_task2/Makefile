build: ## Build the website
	hugo --source ./ --destination ./dist/

clean: ## Clean the dist directory
	rm -rf ./dist/*

post: ## Create a new blog post
	hugo new posts/$(POST_NAME).md
	echo "---\ntitle: $(POST_TITLE)\ndate: $$(date +"%Y-%m-%dT%H:%M:%S")\ndraft: false\n---\n" >> ./content/posts/$(POST_NAME).md

help: ## Show available targets and their usage
    @echo "Usage: make [target]"
    @echo "Targets:"
    @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
