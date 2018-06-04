dev:
	./bin/cub

lint:
	markdownlint *.md .github

test:
	shellcheck bin/cub
