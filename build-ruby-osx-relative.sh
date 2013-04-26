#!/bin/bash
#
# Build an @executable_path relative ruby for OSX.

set -o errexit

# Remove macports from path
export PATH=~/bin:/sbin:/usr/sbin:/usr/bin:/bin

# We statically link with libyaml to avoid needing to build *it*
# as path-relative as well.
#
# Commit da4a27b4 modifies ext/psych/extconf.rb to force static link
# and currently hard-codes the following ruby-deps path:
RUBY_DEPS=/usr/local/ruby-deps

for f in include/yaml.h lib/libyaml.a ; do
  depfile="$RUBY_DEPS/$f"
  if [ ! -f "$depfile" ]; then
    echo error: prerequisite "$depfile" not found
    exit 1
  fi
done

echo "Beginning full rebuild of ruby..."
make distclean || echo "Already distcleaned? Continuing..."
autoconf -f

RPATH_OPTS="-Wl,-rpath,@executable_path/../lib -Wl,-rpath,@executable_path/../ruby19/lib"
SDK_OPTS="-isysroot /Developer/SDKs/MacOSX10.6.sdk -mmacosx-version-min=10.6"
PFX=/opt/ruby193
CFLAGS="-O3 -g -DRUBY_INSTALL_PREFIX_ENV=$PFX -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Werror=pointer-arith -Werror=write-strings -Werror=declaration-after-statement -Werror=shorten-64-to-32 -Werror=implicit-function-declaration $SDK_OPTS -I/usr/local/ruby-deps/include" DLDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -Wl,-flat_namespace $RPATH_OPTS $SDK_OPTS" LDFLAGS="$RPATH_OPTS $SDK_OPTS" ./configure --prefix=$PFX --program-suffix=19 --enable-shared --enable-load-relative --disable-install-doc --with-arch=i386 --with-gcc=gcc-4.2

# NOW PATCH config.status, removing |#_!!_#| garbage added by configure, which screws up @executable_path
#
/opt/ruby193/bin/ruby19 -i -pe 'gsub(/@\|#_!!_#\|executable_path/,"@executable_path")' config.status

make && make test

