#!/bin/bash
#
# Build an @executable_path relative ruby for OSX.

set -e

# Remove macports from path
export PATH=~/bin:/sbin:/usr/sbin:/usr/bin:/bin

echo "Beginning full rebuild of ruby..."
make distclean || echo "Already distcleaned? Continuing..."
# autoconf -f

ARCH="i386"
RPATH_OPTS="-Wl,-rpath,@executable_path/../lib -Wl,-rpath,@executable_path/../pmruby/lib"
# RPATH_OPTS="-Wl,-rpath,@executable_path/../pmruby/lib"
SDK_OPTS="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.8"
PFX=/opt/ruby22

CFLAGS_OVERRIDE="-O3 -DRUBY_INSTALL_PREFIX_ENV=$PFX -fno-fast-math -ggdb3 -Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wunused-variable -Wpointer-arith -Wwrite-strings -Wdeclaration-after-statement -Wshorten-64-to-32 -Wimplicit-function-declaration -Wdivision-by-zero -Wdeprecated-declarations -Wextra-tokens  -fno-common -pipe -arch $ARCH $SDK_OPTS"

# -install_name @executable_path/../pmruby/lib/libruby.2.2.0.dylib
DLDFLAGS_OVERRIDE="-Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -install_name @rpath/libruby.2.2.0.dylib -current_version 2.2.0 -compatibility_version 2.2.0  -fstack-protector -Wl,-u,_objc_msgSend -framework CoreFoundation -arch $ARCH"

CFLAGS="$CFLAGS_OVERRIDE" LDSHARED="clang -dynamiclib" DLDFLAGS="$DLDFLAGS_OVERRIDE" LDFLAGS="$RPATH_OPTS $SDK_OPTS" ./configure --prefix=$PFX --program-suffix=22 --enable-shared --enable-load-relative --disable-install-doc --with-arch=$ARCH


make && make test

