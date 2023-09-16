# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name           = 'proto-convert'
  spec.version        = '0.4.2'
  spec.date           = '2023-09-16'
  spec.authors        = ['Azeem Sajid']
  spec.email          = ['azeem.sajid@gmail.com']

  spec.summary        = 'Protobuf Message Converter [Binary <-> JSON]'
  spec.description    = 'a CLI tool to convert protobuf messages from binary to JSON and vice versa'
  spec.homepage       = 'https://github.com/iamAzeem/proto-convert'
  spec.license        = 'MIT'

  spec.executables    = ['proto-convert']

  spec.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.0'
  spec.add_runtime_dependency 'google-protobuf', '~> 3.12'
end
