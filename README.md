# ~/.dotfiles/

This is what I use every day for work, play, and everything else.

You may also like [bootstart](https://projects.blackieops.com/alexblackie/bootstart):
the Ansible playbooks I use to provision my workstations/laptops.

Setup is very easy:

```bash
$ make
```

The Makefile simply copies the files out of the `configs/` folder and into `~/`.

There is also some dconf config tracked for Gnome Terminal and Gnome Extension
settings. It's also managed via make targets.

To load tracked dconf keys:

```bash
$ make dconf
```

To dump your dconf config:

```bash
$ make dconfdump
```

Then commit the changes.
