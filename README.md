# WSL-Distro-Env-Manager

## Synopsis

Easily manage your WSL environment with a handful of generic bash scripts.
Applications are seperated out into directories within [modules](modules/).

## Quick start

```sh
./init_distro.sh -d "Ubuntu-18.04" -m "generic" # -d:Distro, -m:Module
```

## Security

Place `.pgp` & `.gitconfig` files into the `backups/` directory (*ignored by git*).

Example `.gitconfig`:

```sh
[user]
	name = First Last
	email = my@email.com
	signingKey = xxx

[commit]
	gpgSign = True
```

How to import pgp files from keybase.io:

```sh
keybase pgp export -q xxx > backups/public.pgp
keybase pgp export -q xxx --secret > backups/private.pgp
```

## Scripts

1. `init_distro.sh` (Re)initialize env.
2. `status_distro.sh` Status of env.
3. `backup_distro.sh` Backup env to `.tar` file.
4. `down_distro.sh` Shutdown env.
5. `up_distro.sh` Bring env up after shutdown.
6. `destroy_distro.sh` Destroy env.
7. `restore_distro.sh` Restore env from `.tar` file.
8. `test_distro.sh` Run module specific env tests.
9. `fix_distro.sh` Run module specific env fixes.

The following scripts can be run in various order, but some run orders are not compatible (e.g. *destroy then test*):

```sh
d="Ubuntu"; # Distro name
m="generic"; # Module name

./init_distro.sh -d $d -m $m;
./status_distro.sh -d $d -m $m;
./backup_distro.sh -d $d -m $m;
./down_distro.sh -d $d -m $m;
./up_distro.sh -d $d -m $m;
./destroy_distro.sh -d $d -m $m;
./restore_distro.sh -d $d -m $m;
./test_distro.sh -d $d -m $m;

```
---

**Mandatory:**
 * `-d`, `--distro`  VAL  Distro name (*reference: wsl --list --online*)
 * `-m`, `--module`  VAL  Application name

**Optional:**
 * `-u`, `--user`    VAL  username
 * `-h`, `--help`         Prints this help

**Examples:** 
 * `[SCRIPT] -d VAL -m VAL -u VAL`
 * `./init_distro.sh -d "Ubuntu-18.04" -m "generic" -u "user3"`

## Tips

Quick re-use arguments:
  1. Create `backups/default.sh` file
     * `-d Ubuntu-20.04 -m generic -u user3`
  2. Run script using default file
     * `./init_distro.sh $(cat backups/defaults.sh)`

## Notes

Currently, only tested using Git Bash via Windows Terminal.
