EXCLUDES := configs/. configs/..
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard configs/.*))

install:
	git submodule update --init
	cp -Rfv $(DOTFILES) ${HOME}
	cp -Rfv bin/* ${HOME}/bin

dconf:
	# So we have to inject some rules into dconf
	# This UUID is the default one for the first gnome terminal profile
	# You may have to go in and change any setting beforehand for the path to exist.
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/foreground-color "'rgb(173,173,173)'"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/visible-name"'Jellybeans'"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/login-shell "true"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/palette "['rgb(59,59,59)', 'rgb(207,106,76)', 'rgb(153,173,106)', 'rgb(216,173,76)', 'rgb(89,123,197)', 'rgb(160,55,176)', 'rgb(113,185,248)', 'rgb(173,173,173)', 'rgb(99,99,99)', 'rgb(247,146,116)', 'rgb(193,213,146)', 'rgb(255,213,116)', 'rgb(129,163,237)', 'rgb(200,95,216)', 'rgb(153,225,255)', 'rgb(213,213,213)']"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/default-size-rows "45"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/default-size-columns "160"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-system-font "false"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-theme-colors "false"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/allow-bold "false"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/font "'Terminus 8'"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color "'rgb(21,21,21)'"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/audible-bell "false"
	dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/scrollbar-policy "'never'"
