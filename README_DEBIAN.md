```bash
go version
echo $GOPATH
export GOROOT=/usr/local/go:$GOROOT
sudo apt update && sudo apt install debmake
sudo debmake -t -p debhello -u 0.1 -r 1 -x4
cd ../debhello-0.1
sudo nano debian/rules
sudo nano debian/control
sudo debuild
```

```bash
#!/usr/bin/make -f
# You must remove unused comment lines for the released package.
export DH_VERBOSE = 1
export DEB_BUILD_MAINT_OPTIONS = hardening=+all
export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed

%:
    dh $@

override_dh_auto_install:
    dh_auto_install -- prefix=/usr

#override_dh_install:
#       dh_install --list-missing -X.pyc -X.pyo

```