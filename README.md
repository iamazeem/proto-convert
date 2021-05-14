# proto-convert

[![ci](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/iamAzeem/proto-convert?style=flat-square)
[![RubyGems Downloads](https://img.shields.io/gem/dt/proto-convert?color=blue&style=flat-square)](https://rubygems.org/gems/proto-convert)

![Lines of code](https://img.shields.io/tokei/lines/github/iamAzeem/proto-convert?label=LOC&style=flat-square)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/iamAzeem/proto-convert?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/iamAzeem/proto-convert?style=flat-square)

[proto-convert](https://github.com/iamAzeem/proto-convert) is a command-line
tool to convert the protobuf messages from binary to JSON and vice versa.

## Installation

### Prerequisites

Please make sure that the Protocol Buffers Compiler `protoc` is installed.

- https://github.com/protocolbuffers/protobuf#protocol-compiler-installation

### RubyGems

```shell
gem install proto-convert
```

### Bundler

Add the following line to your Gemfile:

```ruby
gem 'proto-convert'
```

And then execute:

```shell
bundle
```

## Usage

```text
$ proto-convert -h
Usage: proto-convert -m [mode] -p [proto] -t [msgtype] -i [input] -o [output]

    -m, --mode [MODE]                conversion mode ["binary2json", "b2j", "json2binary", "j2b"]
    -p, --proto [FILENAME]           protobuf schema (.proto)
    -t, --msgtype [TYPE]             fully-qualified message type
    -i, --input [FILENAME]           source file (JSON/binary)
    -o, --output [FILENAME]          destination file (binary/JSON)
    -v, --version                    prints version information
    -h, --help                       prints help
```

### Test Run

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

#### JSON to Binary Conversion

```text
$ proto-convert -m j2b -p test.proto -t test.Message -i test.json -o test.bin
>> [J] test.json (24 bytes)
<< [B] test.bin (8 bytes)
```

#### Binary to JSON Conversion

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
- Submit the PR.

## License

[MIT](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
