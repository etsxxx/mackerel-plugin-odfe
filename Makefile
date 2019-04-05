REPO = mackerel-plugin-odfe
BIN = $(REPO)
VERSION = 0.0.1

all: clean test build

test:
	go test ./lib

build:
	go build -o bin/$(BIN) main.go

cross:	clean
	goxc -d=./dist

deploy: cross
	ghr -u etsxxx -r $(REPO) v$(VERSION) ./dist/snapshot

builddep:
	GO111MODULE=off go get -v -u github.com/laher/goxc github.com/tcnksm/ghr

clean:
	rm -rf bin dist

.PHONY: test build cross deploy dep depup clean
