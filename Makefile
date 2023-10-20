SECRETS_DIR := ./secrets
SECRETS_FILES := $(SECRETS_DIR)/secrets.yml $(SECRETS_DIR)/backend.hcl
ENCRYPTED_FILES := $(SECRETS_FILES:%=%.enc)
PASSWORD := $(or $(SECRET_PASS), $(shell read -s -p "Enter password: " && echo $$REPLY))

lock: $(ENCRYPTED_FILES)
	@-rm $(SECRETS_FILES)

unlock: $(SECRETS_FILES)
	@-rm $(ENCRYPTED_FILES)

init: unlock
	tofu init --backend-config=$(SECRETS_DIR)/backend.hcl

.SECONDARY:

$(ENCRYPTED_FILES): %.enc: %
	openssl aes-256-cbc -salt -pbkdf2 -in $< -out $@ -pass pass:$(PASSWORD)

$(SECRETS_FILES): %: %.enc
	openssl aes-256-cbc -d -salt -pbkdf2 -in $< -out $@ -pass pass:$(PASSWORD)