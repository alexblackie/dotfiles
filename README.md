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

## Platform-specific configuration

By default, only platform-agnostic configuration is installed (such as vim, git,
etc). However, Linux and macOS have specific software that also needs to be
configured, but I didn't want those to be spewed all over each other
unnecessarily.

So, dotfiles are split into three groups: `macOS`, `linux`, and `common`.
`common` is always installed, and `linux` and `macos` can be passed as arguments
to the script to install those respective platform-specific configs.

For example:

```
$ ./install linux
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
