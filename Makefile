PLUG_PATH=$(HOME)/.local/share/nvim/site/autoload/plug.vim

install: plug
	@bash ./prompt-install.sh
	# stow --verbose --target=$$HOME --restow */

plug:
	@if [ ! -f "$(PLUG_PATH)" ]; then \
		echo "Installing vim-plug..."; \
		curl -fLo "$(PLUG_PATH)" --create-dirs $(PLUG_URL); \
	else \
		echo "vim-plug already installed."; \
	fi

delete:
	stow --verbose --target=$$HOME --delete */
