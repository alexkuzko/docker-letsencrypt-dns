#!/bin/sh
set -e

cd /etc/letsencrypt
if [[ -n $DELEGATED_DOMAIN ]] && [[ -n $DELEGATED_SUBDOMAIN ]]; then
lexicon $LEXICON_OPTIONS $LEXICON_PROVIDER $LEXICON_PROVIDER_OPTIONS delete $DELEGATED_DOMAIN TXT --name="_acme-challenge.$DELEGATED_SUBDOMAIN." --content="$CERTBOT_VALIDATION"
else
lexicon $LEXICON_OPTIONS $LEXICON_PROVIDER $LEXICON_PROVIDER_OPTIONS delete $CERTBOT_DOMAIN TXT --name="_acme-challenge.$CERTBOT_DOMAIN." --content="$CERTBOT_VALIDATION"
fi