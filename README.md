# WSL-Distro-Env-Manager

## Synopsis

Easily manage your WSL environment with a handful of generic bash scripts.
Applications are seperated out into directories within [modules](modules/).

## Quick start

```sh
./init_distro.sh -m0 "Ubuntu-18.04" -m1 "generic" # -m0:Distro, -m1:Module
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
m0="Ubuntu"; # Distro name
m1="generic"; # Module name

./init_distro.sh -m0 $m0 -m1 $m1;
./status_distro.sh -m0 $m0 -m1 $m1;
./backup_distro.sh -m0 $m0 -m1 $m1;
./down_distro.sh -m0 $m0 -m1 $m1;
./up_distro.sh -m0 $m0 -m1 $m1;
./destroy_distro.sh -m0 $m0 -m1 $m1;
./restore_distro.sh -m0 $m0 -m1 $m1;
./up_distro.sh -m0 $m0 -m1 $m1;
./test_distro.sh -m0 $m0 -m1 $m1;

```
---

**Mandatory:**
 * `-m0`, `--mandatory0`  VAL  Distro name (*reference: wsl --list --online*)
 * `-m1`, `--mandatory1`  VAL  Application name

**Optional:**
 * `-o0`, `--optional0`   VAL  username
 * `-h`,  `--help`             Prints this help

**Examples:** 
 * `[SCRIPT] -m0 VAL -m1 VAL -o0 VAL`
 * `./init_distro.sh -m0 "Ubuntu-18.04" -m1 "generic" -o0 "user3"`

## Notes

Currently, only tested using Git Bash via Windows Terminal.