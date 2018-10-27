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
$ ./install -f
```

If you want it to echo every command it will run without actually changing
anything, you can set `DEBUG` to any value before running:

```
$ DEBUG=1 ./install
```

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
