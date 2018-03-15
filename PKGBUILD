# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=dfhack-bin
_pkgname=dfhack
pkgver=0.44.07
_pkgver=$pkgver-alpha1
pkgrel=1
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="http://dfhack.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=("dwarffortress=$pkgver" lua protobuf libpng12 libxrandr libjpeg6 freetype2 libglvnd libxcursor libxinerama)

conflicts=(dfhack dfhack-git)
provides=(dfhack)

source_i686=(https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-32-gcc-7.tar.bz2)
source_x86_64=(https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-64-gcc-7.tar.bz2)
source=(dfhack.sh
        dfhack-run.sh)

md5sums=('81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')
md5sums_x86_64=('8be95f06f18eba7cee2f485259c0b0ec')
md5sums_i686=('f31d28aec161e112fd64a195456e6497')

prepare() {
  sed -e 's|setarch i386 -R ||' \
      -i $srcdir/dfhack
}

package() {
  install -d $pkgdir/opt/dwarffortress

  cp -r $srcdir/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example,stonesense} $pkgdir/opt/dwarffortress

  install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
  install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run

  install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
