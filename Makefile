TEST ?=
SANDBOX_VERSION = "v0.2.1"

.PHONY: help
help: ## Show available make targets and descriptions.
	@awk 'BEGIN {FS = ":.*## "} \
		/^[a-zA-Z0-9_.-]+:.*## / { \
			target=$$1; \
			desc=$$2; \
			targets[++count]=target; \
			descs[count]=desc; \
			if (length(target) > maxlen) maxlen=length(target); \
		} \
		END { \
			for (i=1; i<=count; i++) printf "  %-" maxlen "s  %s\n", targets[i], descs[i]; \
		}' $(MAKEFILE_LIST)


.PHONY: create-cluster
create-cluster: ## Creates a local kind cluster for the project
	kind create cluster --name agent-sandbox

.PHONY: delete-cluster
delete-cluster: ## Deletes the local kind cluster for the project
	kind delete cluster --name agent-sandbox

.PHONY: install-sandbox
install-sandbox: install-sandbox-core install-sandbox-extensions ## Installs k8s agent sandbox core and extension components

.PHONY: install-sandbox-core
install-sandbox-core:
	kubectl apply \
		-f https://github.com/kubernetes-sigs/agent-sandbox/releases/download/${SANDBOX_VERSION}/manifest.yaml

.PHONY: install-sandbox-extensions
install-sandbox-extensions:
	kubectl apply \
		-f https://github.com/kubernetes-sigs/agent-sandbox/releases/download/${VERSION}/extensions.yaml
