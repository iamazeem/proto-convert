<!-- omit in toc -->
# proto-convert

[![ci](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/iamazeem/proto-convert/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/iamAzeem/proto-convert?style=flat-square)
[![RubyGems Downloads](https://img.shields.io/gem/dt/proto-convert?color=blue&style=flat-square)](https://rubygems.org/gems/proto-convert)

![Lines of code](https://img.shields.io/tokei/lines/github/iamAzeem/proto-convert?label=LOC&style=flat-square)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/iamAzeem/proto-convert?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/iamAzeem/proto-convert?style=flat-square)

- [Overview](#overview)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [RubyGems](#rubygems)
  - [Bundler](#bundler)
- [Usage](#usage)
- [Test Run](#test-run)
  - [JSON to Binary Conversion](#json-to-binary-conversion)
  - [Binary to JSON Conversion](#binary-to-json-conversion)
- [Contribute](#contribute)
- [License](#license)

## Overview

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

```text
$ proto-convert -h
Usage: proto-convert -m [mode] -p [proto] -t [msgtype] -i [input] -o [output]

    -m, --mode [MODE]                conversion mode ["binary2json", "b2j", "json2binary", "j2b"]
    -p, --proto [FILENAME]           protobuf schema (.proto)
    -t, --msgtype [TYPE]             fully-qualified message type
    -i, --input [FILENAME]           source file (JSON/binary)
    -o, --output [FILENAME]          destination file (binary/JSON)
    -d, --debug                      prints debugging information
    -h, --help                       prints help
```

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

With debug flag `-d`:

```text
$ proto-convert -m j2b -p test.proto -t test.Message -i test.json -o test.bin -d
>> /usr/local/bin/proto-convert 0.3.0 [debug mode]

>> Arguments:
       mode : json2binary
      proto : log.proto
    msgtype : service.logging.Log
      input : log.json
     output : log-out.bin
      debug : true

>> Compiling [log.proto]
   File path: /home/azeem/test/log.proto
   Running protoc 3.12.3:

     protoc \
       --ruby_out=/home/azeem/test \
       --proto_path=/home/azeem/test \
       /home/azeem/test/log.proto

   Compiled [/home/azeem/test/log.proto]
   Validating [/home/azeem/test/log_pb.rb]
   Validatd [/home/azeem/test/log_pb.rb]
<< Compilion and validation complete! [/home/azeem/test/log.proto => /home/azeem/test/log_pb.rb]

>> Validating msgtype [service.logging.Log] in [/home/azeem/test/log_pb.rb]
   msgtype [service.logging.Log] available? yes
   Available types:
   - service.logging.Log
   - service.logging.Log.Context
<< Validation of msgtype [service.logging.Log] complete!

>> Converting [log.json], mode: json2binary
>> [J] log.json (183 bytes)
<< [B] log-out.bin (86 bytes)
>> Converion complete! [log.json] => [log-out.bin]
```

### Binary to JSON Conversion

```text
$ proto-convert -m b2j -p test.proto -t test.Message -i test.bin -o test.json
>> [B] test.bin (8 bytes)
<< [J] test.json (24 bytes)
```

With debug flag `-d`:

```text
>> /usr/local/bin/proto-convert 0.3.0 [debug mode]

>> Arguments:
       mode : binary2json
      proto : test.proto
    msgtype : test.Message
      input : test.bin
     output : test.json
      debug : true

>> Compiling [test.proto]
   File path: /home/azeem/test/test.proto
   Running protoc 3.12.3:

     protoc \
       --ruby_out=/home/azeem/test \
       --proto_path=/home/azeem/test \
       /home/azeem/test/test.proto

   Compiled [/home/azeem/test/test.proto]
   Validating [/home/azeem/test/test_pb.rb]
   Validatd [/home/azeem/test/test_pb.rb]
<< Compilion and validation complete! [/home/azeem/test/test.proto => /home/azeem/test/test_pb.rb]

>> Validating msgtype [test.Message] in [/home/azeem/test/test_pb.rb]
   msgtype [test.Message] available? yes
   Available types:
   - test.Message
<< Validation of msgtype [test.Message] complete!

>> Converting [test.bin], mode: binary2json
>> [B] test.bin (8 bytes)
<< [J] test.json (24 bytes)
>> Converion complete! [test.bin] => [test.json]
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
