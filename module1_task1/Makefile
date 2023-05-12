build:
	hugo --source ./ --destination ./dist/

clean:
	rm -rf ./dist/*

post:
	POST_NAME=$$(cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1); \
	POST_TITLE=$$POST_NAME; \
	hugo new posts/$$POST_NAME.md; \
	echo "---\ntitle: $$POST_TITLE\ndate: $$(date +"%Y-%m-%dT%H:%M:%S")\ndraft: false\n---\n" >> ./content/posts/$$POST_NAME.md; \
	echo -n $${#POST_NAME}
