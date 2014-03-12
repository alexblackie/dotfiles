# ~/.dotfiles/

This is what I use every day for code, prose, and other fun stuff like that.

Setup is fairly simple; check out the `Makefile`, or just run:

```
$ make setup
$ make install
```

There are also things that are just for Linux or OSX. These are also simple to
install:

```
$ make osxinstall
$ make linuxinstall
```

---

The Makefile simply copies the files out of the repo folder and into `~/`. This
allows you to, for example, add passwords to configuration files (such as
irssi), without accidentally committing them or being annoyed by constant
untracked changes.

---

## OSX

The way I use OSX is simple: turn off everything. I don't give a shit about
animations, nor do I have patience for slow responses. My `osxinstall` Make
target also sets a shit-tonne of sane defaults, which I'll attempt to document
below.

### Finder
* Un-hide the Library folder
* No quarantine (doesn't affect files downloaded *after*, unfortunately)
* Show all hidden files
* Show status bar
* Ability to CMD+Q
* Disable all Finder-related animations
* Don't prompt about file extension changes
* Enable text-selection in Quicklook
* Don't write .DS_Store to network volumes
* Skip verification step when mounting disk images
* Disable Time Machine's popup when you plug in an external HD
* Enable Airdrop over ethernet
* Don't ask about emptying the trash
* Show all filename extensions
* Always show expanded save dialogue
* Disable the desktop (completely; no files, no drives--NOTHING!)

### Safari
* Show develop menu
* Enable web inspector in embedded webkit

### Other
* Try to turn off as many animations as possible
* Tap-to-click everywhere
* Fucking fast key repeat (off-the-scale)
* Dashboard as an overlay (not a space)
* No "rubber-band" (i.e., Lion-style) overscrolling
* Top-left hot-corner set to Mission Control
* No autocorrect (srsly wtf osx)
