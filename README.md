# YleTf Plugin for Terraform Landscape

[![Gem Version](https://badge.fury.io/rb/yle_tf-landscape.svg)](https://badge.fury.io/rb/yle_tf-landscape)
[![Build Status](https://travis-ci.org/Yleisradio/yle_tf-landscape.svg?branch=master)](https://travis-ci.org/Yleisradio/yle_tf-landscape)

A plugin for [YleTf](https://github.com/Yleisradio/yle_tf) adding a `planb` command that runs `terraform plan` with piping the output through [Terraform Landscape](https://github.com/coinbase/terraform-landscape) for reformatting the output to be easier to read and understand.

## Installation

If you are running `tf` standalone, install the plugin with:

```sh
gem install yle_tf-landscape
```

and configure it for YleTf by listing it in the `TF_PLUGINS` environment variable. For example in Posix shells:

```sh
export TF_PLUGINS='yle_tf-landscape'
```

If you install and use YleTf from your own software or wrappers, add this line to your application's Gemfile for automatic plugin loading:

```ruby
group :tf_plugins do
  gem 'yle_tf-landscape'
end
```

You can also add it without group definition, and load it in the code:

```ruby
require 'yle_tf-landscape'
```

## Configuration

There is no configuration for the plugin.

When calling `tf <env> planb` with `--no-color`, also the Landscape output will be without colors.

## Issues

Note that new Terraform versions might change the plan output format, breaking Terraform Landscape parsing. This can sometimes lead to errors, or broken or even totally missing output. In such cases you can try updating the Landscape gem to the latest version (`bundle update` or `gem install terraform_landscape`). You can also consult the open issues of both [Terraform Landscape](https://github.com/coinbase/terraform-landscape/issues) and [this plugin](https://github.com/Yleisradio/yle_tf-landscape/issues).

## Development

After checking out the repo, run `bundle update` to install and update the dependencies. Then, run `bundle exec rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yleisradio/yle_tf-landscape. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
