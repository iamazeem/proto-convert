# proto-convert

[![ci](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-darkgreen.svg?style=flat-square)](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/iamAzeem/proto-convert?style=flat-square)
[![RubyGems Downloads](https://img.shields.io/gem/dt/proto-convert?style=flat-square)](https://rubygems.org/gems/proto-convert)
[![Buy Me a Coffee](https://img.shields.io/badge/Support-Buy%20Me%20A%20Coffee-orange.svg?style=flat-square)](https://www.buymeacoffee.com/iamazeem)

[proto-convert](https://github.com/iamAzeem/proto-convert) is a CLI tool
to convert [protobuf](https://github.com/protocolbuffers/protobuf) messages
from binary to [JSON](https://www.json.org/json-en.html) and vice versa.

[Tested](./test/run_tests.sh) on Ubuntu, macOS and Windows runners.
For details, see [CI workflow](./.github/workflows/ci.yml).

## Installation

Make sure that the Protocol Buffers Compiler `protoc` is installed. Follow these
[instructions](https://github.com/protocolbuffers/protobuf#protocol-compiler-installation)
to install it.

Install `proto-convert` with [RubyGems](https://rubygems.org/pages/download):

```shell
gem install proto-convert
```

Depending on your installed Ruby version, the latest `google-protobuf` may not
install due to compatibility issues. You need to install the older version
yourself or you may choose to upgrade to a later Ruby version.

It has also been observed that the installed `protoc` and `google-protobuf` gem
may be incompatible and may result into compilation failure of the `input`
file on runtime.

- For Ruby 2.6, `protoc` v3.17.3 and `google-protobuf` v3.12 work fine.
- For Ruby 2.7 and later, the latest versions of both should work fine.

## Usage

Run `proto-convert -h` for usage help.

```text
$ proto-convert -h
Usage: bin/proto-convert -m [mode] -p [proto] -t [msgtype] -i [input] -o [output]

OPTIONS:

    -m, --mode [MODE]                conversion mode ["binary2json", "b2j", "json2binary", "j2b"]
    -p, --proto [FILENAME]           protobuf schema (.proto)
    -t, --msgtype [TYPE]             fully-qualified message type
    -i, --input [FILENAME]           source file (JSON/binary)
    -o, --output [FILENAME]          destination file (binary/JSON)
    -v, --verbose                    print verbose information
    -h, --help                       print help
```

**NOTE**: Use `-v` / `--verbose` flag to print detailed intermediate steps.

## Test Run

Consider this simple .proto file ([`test.proto`](test/test.proto)):

```protobuf
syntax = "proto3";

package test;

message Message {
    int32 id = 1;
    string body = 2;
}
```

See [`test`](test) directory for test files.

### JSON to Binary Conversion

```text
$ proto-convert -m j2b -p test.proto -t test.Message -i test.json -o test.bin
>> [J] test.json (24 bytes)
<< [B] test.bin (8 bytes)
```

### Binary to JSON Conversion

```text
$ proto-convert -m b2j -p test.proto -t test.Message -i test.bin -o test.json
>> [B] test.bin (8 bytes)
<< [J] test.json (24 bytes)
```

Output:

```text
$ cat test.json
{"id":123,"body":"test"}
```

## Contribute

- [Fork](https://github.com/iamazeem/proto-convert/fork) the project.
- Check out the latest `main` branch.
- Create a `feature` or `bugfix` branch from `main`.
- Commit and push your changes.
- Make sure to add tests. See [CI](./.github/workflows/ci.yml).
- Run [Rubocop](https://github.com/rubocop/rubocop) and fix the lint errors.
- Submit the PR.

## License

[MIT](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
