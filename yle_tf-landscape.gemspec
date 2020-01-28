# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yle_tf-landscape/version'

Gem::Specification.new do |spec|
  spec.name        = 'yle_tf-landscape'
  spec.version     = YleTfPlugins::Landscape::VERSION
  spec.summary     = 'YleTf plugin for Terraform Landscape'
  spec.description = 'A plugin for YleTf adding a `planb` command that runs ' \
                     '`terraform plan` with piping the output through ' \
                     'Terraform Landscape for reformatting the output to be '\
                     'easier to read and understand'
  spec.homepage    = 'https://github.com/Yleisradio/yle_tf-landscape'
  spec.license     = 'MIT'

  spec.authors = [
    'Yleisradio',
    'Teemu Matilainen',
  ]
  spec.email = [
    'devops@yle.fi',
    'teemu.matilainen@iki.fi',
  ]

  spec.files = Dir['lib/**/*.rb']

  spec.require_paths = ['lib']

  # Terraform Landscape v0.3 requires Ruby 2.5+ while YleTf supports Ruby 2.3+.
  # There is a "terraform_landscape_0.3" branch for testing.
  spec.add_dependency 'terraform_landscape', '>= 0.1.13', '< 0.3'
  spec.add_dependency 'yle_tf', '>= 0.2'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
