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
target also sets a shit-tonne of sane defaults, including:

* No window-growing animations
* Skip verification during disk image mounting
* Tell Time Machine to fuck off and never pop up when I plug in an external HD
* Show Finder status bar
* Tap-to-click enabled OS-wide
* Don't warn when I empty the trash
* Keyboard repeat rate at maximum (off-the-scale)
* ... and a bunch more.
