# github.com/rubicks/doxngin/Dockerfile                                                                                                                        

from alpine
run \
  apk add --update doxygen nginx && \
  rm -vrf /var/cache/apk/*
workdir /usr/share/nginx
volume ["/usr/share/nginx"]
expose 80
cmd \
  set -o pipefail                           && \
  export DOXYFILE=$(mktemp)                 && \
  echo "\${DOXYFILE} == \"${DOXYFILE}\""    && \
  >>${DOXYFILE} echo "RECURSIVE = YES"      && \
  >>${DOXYFILE} echo "CREATE_SUBDIRS = yes" && \
  cat ${DOXYFILE}                           && \
  doxygen ${DOXYFILE}                       && \
  nginx -g 'daemon off; error_log stderr info;'
