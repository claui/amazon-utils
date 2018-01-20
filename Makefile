PROGRAM_NAME=amazon-chat

.PHONY: build clean run

build: libexec/${PROGRAM_NAME}.scpt

clean:
	rm -f libexec/*.scpt

libexec/%.scpt: lib/%.applescript
	mkdir -p libexec
	rm -f "$@"
	osacompile -o "$@" "$<"

run: build
	"bin/${PROGRAM_NAME}"
