
FILENAME="$(wildcard /workspaces/protos/generated)"

default: build

build:
	go mod tidy
	bazel run gazelle
	bazel build ...
	cp ./bazel-bin/entities/entities_go_proto_/github.com/jjhegedus/proto/entities/entities.pb.go ./entities/

old-build:
	echo "build"

ifneq ($(FILENAME), "")
	rm -rf /workspaces/ndtech-entities/generated
endif

	mkdir generated

test:
	echo "test"