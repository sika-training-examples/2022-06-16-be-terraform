fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -recursive -check

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)

tf-providers-lock:
	terraform providers lock \
		-platform=windows_amd64 \
		-platform=darwin_amd64 \
		-platform=darwin_arm64 \
		-platform=linux_amd64
	git add .terraform.lock.hcl
	git commit -m "[auto] chore(terraform): Lock providers to .terraform.lock.hcl" .terraform.lock.hcl

tf-init-state:
ifndef ACCESS_KEY
	$(error ACCESS_KEY is undefined)
endif
ifndef SECRET_KEY
	$(error SECRET_KEY is undefined)
endif
	terraform init \
		-backend-config="access_key=${ACCESS_KEY}" \
		-backend-config="secret_key=${SECRET_KEY}"

cost:
	infracost breakdown --path . --show-skipped
