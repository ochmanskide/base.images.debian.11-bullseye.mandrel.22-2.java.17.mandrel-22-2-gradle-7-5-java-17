#!/usr/bin/env bash

if [ -z "$CACERTS_FILE" ]; then
# you should have GRAALVM_HOME configured. For example /usr/lib/jvm/default-java/jre/lib/security/cacerts
    CACERTS_FILE="$GRAALVM_HOME"/lib/security/cacerts
fi

csplit -sk /home/aws/rds-combined-ca-bundle.pem "/-BEGIN CERTIFICATE-/" "{$(grep -c 'BEGIN CERTIFICATE' /home/aws/rds-combined-ca-bundle.pem | awk '{print $1 - 2}')}"

export PATH="${JAVA_HOME}/bin:${PATH}"

for CERT in xx*; do
    # extract a human-readable alias from the cert
    ALIAS=$(openssl x509 -noout -text -in $CERT |
                   perl -ne 'next unless /Subject:/; s/.*CN=//; print')
    echo "importing $ALIAS"
    # import the cert into the default java keystore
    keytool -import \
            -keystore  $CACERTS_FILE \
            -storepass changeit -noprompt \
            -alias "$ALIAS" -file $CERT
done
