prefix = /usr/local

build:
	go build -o bin/server server.go

run:
	go run server.go

install:
	build
	install -D bin/server $(DESTDIR)$(prefix)/bin/hello
