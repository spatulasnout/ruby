#!/bin/bash
#
# Build an @executable_path relative ruby for OSX.

set -e

RB_SUFFIX="20"
PM_RELATIVE_LIB_DIR="../ruby/lib"  # This is different for our embedded ruby, vs. Catalog ruby (counterintuitively, embedded is 'ruby' and standalone is 'pmruby')
ARCH="x86_64"
if [[ -z "$HOMEBREW_PREFIX" ]]; then
  BREW_DIR="$HOMEBREW_PREFIX"
else
  BREW_DIR="/usr/local/cbits-build-x64/release/homebrew"
fi

if [[ -z "$1" ]]; then
  PFX="/usr/local/ruby$RB_SUFFIX"
else
  PFX="$1"
fi

echo "Using --prefix=$PFX"


unset RUBYOPT
unset RUBY_INSTALL_PREFIX

export PATH="$BREW_DIR/bin:/sbin:/usr/sbin:/usr/bin:/bin"

export PKG_CONFIG_PATH="$BREW_DIR/lib/pkgconfig:$BREW_DIR/opt/openssl/lib/pkgconfig"

RPATH_OPTS="-Wl,-rpath,@executable_path/../lib -Wl,-rpath,@executable_path/../pmruby/lib"
SDK_OPTS="-mmacosx-version-min=10.9 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk"

export CFLAGS="-O3 -fno-fast-math -ggdb3 -march=core2 -DRUBY_INSTALL_PREFIX_ENV=$PFX $SDK_OPTS -Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wunused-variable -Wpointer-arith -Wwrite-strings -Wdeclaration-after-statement -Wshorten-64-to-32 -Wimplicit-function-declaration"

export CPPFLAGS="$CFLAGS"

export DLDFLAGS="-Wl,-headerpad_max_install_names $RPATH_OPTS -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress"

echo "Beginning full rebuild of ruby..."
if [[ -f "./configure" ]]; then
  make distclean || echo "Already distcleaned? Continuing..."
else
  autoconf
fi

./configure --prefix="$PFX" --program-suffix="$RB_SUFFIX" --enable-shared --enable-load-relative --disable-install-doc --with-out-ext=tcl --with-out-ext=tk

make && make test

