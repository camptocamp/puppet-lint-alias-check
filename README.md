puppet-lint-alias-check
====================================

[![Build Status](https://img.shields.io/travis/camptocamp/puppet-lint-alias-check.svg)](https://travis-ci.org/camptocamp/puppet-lint-alias-check)
[![Gem Version](https://img.shields.io/gem/v/puppet-lint-alias-check.svg)](https://rubygems.org/gems/puppet-lint-alias-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-alias-check.svg)](https://rubygems.org/gems/puppet-lint-alias-check)
[![Coverage Status](https://img.shields.io/coveralls/camptocamp/puppet-lint-alias-check.svg)](https://coveralls.io/r/camptocamp/puppet-lint-alias-check?branch=master)
[![Gemnasium](https://img.shields.io/gemnasium/camptocamp/puppet-lint-alias-check.svg)](https://gemnasium.com/camptocamp/puppet-lint-alias-check)

A puppet-lint plugin to check for the alias parameter in resources.

## Installing

### From the command line

```shell
$ gem install puppet-lint-alias-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-alias-check', :require => false
```

## Checks

### Alias parameter used

The `alias` parameter should not be used most of the time.
In Puppet 4, resources cannot be accessed using the `alias` parameter,
making it quite useless.

A proper use of the namevar with static titles is better practice.

#### What you have done

```puppet
package { $foo::params::pkg:
  ensure => package,
  alias  => 'foo',
}
```

#### What you should have done

```puppet
package { 'foo':
  ensure => package,
  name   => $foo::params::pkg,
}
```

#### Disabling the check

To disable this check, you can add `--no-alias-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-alias-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_alias')
```
