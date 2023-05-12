build:
	hugo --source ./ --destination ./dist/

clean:
	rm -rf ./dist/*

post:
	hugo new posts/$(POST_NAME).md
	echo "---\ntitle: $(POST_TITLE) ./content/posts/$(POST_NAME).md
