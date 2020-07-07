# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name           = 'proto-convert'
  spec.version        = '0.1.0'
  spec.date           = '2020-07-07'
  spec.authors        = ['Azeem Sajid']
  spec.email          = ['azeem.sajid@gmail.com']

  spec.summary        = 'Protobuf Message Converter [Binary <-> JSON]'
  spec.description    = 'A command line tool to convert protobuf messages from binary to JSON and vice versa'
  spec.homepage       = 'https://github.com/iamAzeem/proto-convert'
  spec.license        = 'MIT'

  spec.executables    = ['proto-convert']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_runtime_dependency 'google-protobuf', '~> 3.12', '>= 3.12.2'
end
