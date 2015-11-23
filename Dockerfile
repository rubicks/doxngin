# github.com/rubicks/doxngin/Dockerfile                                                                                                                        

from alpine
run \
  apk add --update doxygen nginx && \
  rm -vrf /var/cache/apk/*
workdir /usr/share/nginx
volume ["/usr/share/nginx"]
cmd \
  set -o pipefail && \
  echo "RECURSIVE = YES; CREATE_SUBDIRS = YES" | doxygen - && \
  nginx -g 'daemon off; error_log stderr info;'
