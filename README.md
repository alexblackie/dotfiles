# `~/.dotfiles`

This is what I use every day for work, play, and everything else.

You may also like [alexblackie/setup](https://github.com/alexblackie/setup):
the Ansible playbooks I use to provision my workstations/laptops.

Setup is very easy:

```bash
$ ./install
```

The script will symlink all the configs into the right place in the home folder.

All files that are symlinked are recorded in a receipt so they can be
rolled-back easily. Simply pass `rollback` to the install script to delete all
symlinks:

```
$ ./install rollback
```

If you want it to echo every command it will run without actually changing
anything, you can set `DEBUG` to any value before running:

```
$ DEBUG=1 ./install
```
