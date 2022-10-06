#!/usr/bin/env bash

set +x
set -e

#/opt/graalvm/bin/gu install native-image

strip --strip-unneeded \
 /opt/graalvm/bin/unpack200 `# does not exist in Java 17`  \
 /opt/graalvm/languages/js/bin/js \
 /opt/graalvm/languages/llvm/bin/lli `# does not exist in dev` \
 /opt/graalvm/languages/llvm/native/bin/graalvm-native-* `# does not exist in dev` \
 /opt/graalvm/lib/installer/bin/gu `# does not exist in dev` \
 /opt/graalvm/lib/svm/bin/native-image || true

if [[ $UPX_COMPRESS == "true" ]]; then
 /opt/upx/upx -9 \
    /opt/graalvm/languages/llvm/bin/lli \
    /opt/graalvm/languages/llvm/native/bin/graalvm-native-* \
    /opt/graalvm/lib/installer/bin/gu \
    /opt/graalvm/lib/svm/bin/native-image || true
    #/opt/graalvm/bin/unpack200 \
    #/opt/graalvm/languages/js/bin/js \
fi

export JAVA_MAJOR_VERSION=$(java -fullversion 2>&1 | sed -E -n 's/.* version "([^.-]*).*"/\1/p')
rm -rf /opt/upx
