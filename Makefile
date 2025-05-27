setup:
	@docker build --progress=plain -f Containerfile -t mermerd .

run: STORAGE_DIRECTORY   = "$(CURDIR)/storage/"
run:
	@docker run --rm -it \
		--net host \
		-v "$(STORAGE_DIRECTORY):/mnt/storage/" \
		mermerd \
		--runConfig "/etc/mermerd/config.yml" \
		--connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"

test:
	@$(CURDIR)/tests/index.sh
