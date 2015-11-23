# github.com/rubicks/doxngin/Dockerfile                                                                                                                        

from alpine

run \
  apk add --update doxygen nginx && \
  rm -vrf /var/cache/apk/*

workdir /usr/share/nginx

copy . .

run echo "RECURSIVE = YES; CREATE_SUBDIRS = YES" | doxygen -

cmd nginx -g 'daemon off; error_log stderr info'
