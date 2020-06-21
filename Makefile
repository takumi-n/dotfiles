.PHONY: sync sync-vscode

sync: sync-vscode sync-fish

sync-vscode:
	code --list-extensions > vscode/extensions
	cp ~/Library/Application\ Support/Code/User/settings.json vscode/settings.json

sync-fish:
	cp ~/.config/fish/fishfile fish/
	cp ~/.config/fish/config.fish fish/

install: install-vscode

install-vscode:
	cp vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@cat vscode/extensions | while read line; do \
		code --install-extension $$line; \
	done

install-fish:
	cp fish/fishfile ~/.config/fish/fishfile
	cp fish/cofig.fish ~/.config/fish/config.fish