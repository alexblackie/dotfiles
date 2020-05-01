# ~/.dotfiles/

This is what I use every day for work, play, and everything else.

You may also like [bootstart](https://github.com/alexblackie/bootstart):
the Ansible playbooks I use to provision my workstations/laptops.

Setup is very easy:

```bash
$ ./install
```

The script will symlink all the configs into the right place in the home folder.

If you want it to remove existing files to ensure they're fresh and overwritten,
you can run:

```
$ FORCE=1 ./install
```

If you want it to echo every command it will run without actually changing
anything, you can set `DEBUG` to any value before running:

```
$ DEBUG=1 ./install
```

**Note!** The scripts and configuration files herein exclusively target
GNU/Linux systems. While most of the things will probably work on macOS, many of
the GNU tools used in the scripts will not be available, at least not with the
expected executable names. You can probably make it work but I don't want to
have to support that.

## dconf

There are also `dconf` schema dumps for some Gnome settings. Another script is
included to manage these dumps. Just run it to restore the dump:

```
$ ./dconf
```

And to regenerate them from the current dconf settings:

```
$ ./dconf dump
```

## Visual Studio Code

VSCode has no great way to sync extensions between installations, so there is
yet another script to reinstall a list of them using the `code` CLI.

```
$ ./vscode
```
