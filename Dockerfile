FROM       golang:1.5
RUN        go get github.com/tools/godep
RUN        go get github.com/golang/lint/golint
RUN        go get golang.org/x/tools/cmd/goimports
ENV        CGO_ENABLED 0
RUN        go install -a std

MAINTAINER Guillaume J. Charmes <guillaume@charmes.net>
