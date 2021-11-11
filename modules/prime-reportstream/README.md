# [prime-reportstream](https://github.com/CDCgov/prime-reportstream)

```sh
d="Ubuntu-20.04"; # Distro name
m="prime-reportstream"; # Module name
u="primeuser"; # Username

./slm init -d $d -m $m -u $u;
./slm status -d $d -m $m -u $u;
./slm backup -d $d -m $m -u $u;
./slm down -d $d -m $m -u $u;
./slm up -d $d -m $m -u $u;
./slm destroy -d $d -m $m -u $u;
./slm restore -d $d -m $m -u $u;
./slm test -d $d -m $m -u $u;

```
---
