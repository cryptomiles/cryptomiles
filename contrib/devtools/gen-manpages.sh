#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CRYPTOMILESD=${CRYPTOMILESD:-$SRCDIR/cryptomilesd}
CRYPTOMILESCLI=${CRYPTOMILESCLI:-$SRCDIR/cryptomiles-cli}
CRYPTOMILESTX=${CRYPTOMILESTX:-$SRCDIR/cryptomiles-tx}
CRYPTOMILESQT=${CRYPTOMILESQT:-$SRCDIR/qt/cryptomiles-qt}

[ ! -x $CRYPTOMILESD ] && echo "$CRYPTOMILESD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
CMLVER=($($CRYPTOMILESCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for cryptomilesd if --version-string is not set,
# but has different outcomes for cryptomiles-qt and cryptomiles-cli.
echo "[COPYRIGHT]" > footer.h2m
$CRYPTOMILESD --version | sed -n '1!p' >> footer.h2m

for cmd in $CRYPTOMILESD $CRYPTOMILESCLI $CRYPTOMILESTX $CRYPTOMILESQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${CMLVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${CMLVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
