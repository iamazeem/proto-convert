# proto-convert

[![ci](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/iamAzeem/proto-convert?style=flat-square)
[![RubyGems Downloads](https://img.shields.io/gem/dt/proto-convert?style=flat-square)](https://rubygems.org/gems/proto-convert)

[proto-convert](https://github.com/iamAzeem/proto-convert) is a command-line
tool to convert the protobuf messages from binary to JSON and vice versa.

[Tested](./test/run_tests.sh) on:

| OS            | Ruby Version  |
|:-------------:|:-------------:|
| Ubuntu 18.04  | 2.5, 2.6, 2.7 |
| Ubuntu 20.04  | 2.5, 2.6, 2.7 |
| MacOS 10.15   | 2.5, 2.6, 2.7 |

For details, see [CI workflow](./.github/workflows/ci.yml).

## Installation

### Prerequisites

Make sure that the Protocol Buffers Compiler `protoc` is installed. Here are the
[instructions](https://github.com/protocolbuffers/protobuf#protocol-compiler-installation)
to install it.

### RubyGems

Install via RubyGems (you might need the `sudo` privileges):

```shell
gem install proto-convert
```

### Bundler

With Bundler, add the following line to your Gemfile:

```ruby
gem 'proto-convert'
```

And then execute:

```shell
bundle
```

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

- Fork the project.
- Check out the latest `main` branch.
- Create a feature or bugfix branch from `main`.
- Commit and push your changes.
- Make sure to add tests. See [CI](./.github/workflows/ci.yml).
- Run Rubocop locally and fix all the lint warnings.
- For any [README](./README.md) changes, update TOC accordingly.
- Submit the PR.

## License

[MIT](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
