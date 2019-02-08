
Debian
====================
This directory contains files used to package cryptomilesd/cryptomiles-qt
for Debian-based Linux systems. If you compile cryptomilesd/cryptomiles-qt yourself, there are some useful files here.

## cryptomiles: URI support ##


cryptomiles-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install cryptomiles-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your cryptomiles-qt binary to `/usr/bin`
and the `../../share/pixmaps/cryptomiles128.png` to `/usr/share/pixmaps`

cryptomiles-qt.protocol (KDE)

