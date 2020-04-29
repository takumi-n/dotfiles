.PHONY: sync sync-vscode

sync: sync-vscode

sync-vscode:
	code --list-extensions > vscode/extensions
	cp ~/Library/Application\ Support/Code/User/settings.json vscode/settings.json


install: install-vscode

install-vscode:
	cp vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@cat vscode/extensions | while read line; do \
		code --install-extension $$line; \
	done