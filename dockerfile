ARG     GOBUILD_IMAGE=golang:alpine
ARG	BASE_IMAGE=alpine:latest

FROM    $GOBUILD_IMAGE AS gobuild

RUN	apk --update --no-cache add \
	build-base \
	git

RUN	go get github.com/linuxkit/linuxkit/src/cmd/linuxkit

RUN	go get github.com/estesp/manifest-tool

RUN     wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.7.tgz

RUN     tar -xzf docker.tgz -C /

RUN	mkdir -p /mnt/usr/bin

RUN	cp -a /docker/docker /mnt/usr/bin/

RUN    	cp -a /go/bin/linuxkit /mnt/usr/bin/

RUN    	cp -a /go/bin/manifest-tool /mnt/usr/bin/


FROM	alpine:latest

RUN	apk --update --no-cache add \
	ca-certificates \
	expect \
#	docker \
	make \
	git \
	jq

COPY	--from=gobuild /mnt/ /

ENTRYPOINT	[ "/usr/bin/linuxkit" ]
