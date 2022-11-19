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

## 1Password SSH Agent

The default `~/.ssh/config` provides public key identities to map keys to host
patterns. This expects that you either have an `ssh-agent` preloaded with all
the private keys manually, or have the `SSH_AGENT_SOCK` pointing to 1Password's
SSH Agent socket.

Since this is machine- and OS-dependent, we expect it to be configured
externally, such as in `$HOME/.env`.

Example for macOS:

```
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
```

Example for Linux:

```
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
```
