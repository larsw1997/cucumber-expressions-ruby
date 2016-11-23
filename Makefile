.PHONY: build
build:
	bundle install
	bundle exec rake

.PHONY: release
release:
	bundle install
	bundle exec rake build release:guard_clean release:rubygem_push
	version=$$(cat *.gemspec | grep -m 1 ".version *= *" | sed "s/.*= *'\([^']*\)'.*/\1/"); \
	git tag --annotate v$$version --message "Release $$version"
	git push --tags
