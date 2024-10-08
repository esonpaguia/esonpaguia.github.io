bundle := env BUNDLE_GEMFILE=./Gemfile bundle

start: bundle
	${bundle} install && bundle exec jekyll serve --host=0.0.0.0

build: bundle
	${bundle} exec jekyll build --safe

bundle:
	${bundle}