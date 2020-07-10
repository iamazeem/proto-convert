# proto-convert

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
[![RubyGems Downloads](https://img.shields.io/gem/dt/proto-convert?color=blue&style=flat-square&label=Downloads)](https://rubygems.org/gems/proto-convert)

A command line tool to convert protobuf messages from binary to JSON and vice versa.

## Installation

Please make sure that the Protocol Buffers Compiler `protoc` is installed.

### RubyGems

```
$ gem install proto-convert
```

### Bundler

Add following line to your Gemfile:
```ruby
gem "proto-convert"
```

And then execute:
```
$ bundle
```

## Usage

```
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

```
syntax = "proto3";

package test;

message Message {
    int32 id = 1;
    string body = 2;
}
```

These test files (`test.proto`, `test.json`, and `test.bin`) are located in [`test`](test) folder.

**JSON to Binary Conversion**
```
$ proto-convert -m json2binary -p test.proto -t test.Message -i test.json -o test.bin
>> [J] test.json (24 bytes)
<< [B] test.bin (8 bytes)
```

**Binary to JSON Conversion**
```
$ proto-convert -m binary2json -p test.proto -t test.Message -i test.bin -o test.json
>> [B] test.bin (8 bytes)
<< [J] test.json (24 bytes)
```

and,

```
$ cat test.json
{"id":123,"body":"test"}
```

## Contact

Email: azeem.sajid@gmail.com  
LinkedIn: https://www.linkedin.com/in/az33msajid

## License

[MIT](https://github.com/iamAzeem/proto-convert/blob/master/LICENSE)
