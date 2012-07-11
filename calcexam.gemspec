# encoding: utf-8
require File.expand_path('../lib/calcexam/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = "calcexam"
  gem.version = Calcexam::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.authors = ["Alex Avoiants"]
  gem.email = ["shhavel@gmail.com"]
  gem.homepage = "https://github.com/shhavel/calcexam"
  gem.summary = %q{Simple training application. Increasing your arithmetical ability by passing small exam.}
  gem.description = %q{Simple training command line application. Increasing your arithmetical ability. If you need a feature added, send me a message on Github!}
  gem.files = %w(
calcexam.gemspec
bin/calcexam
lib/calcexam.rb
lib/calcexam/exam.rb
lib/calcexam/matrix.rb
lib/calcexam/version.rb
Rakefile
README.md
  )
  gem.test_files = %w(
test/tc_calcexam.rb
features/equality.feature
features/support/env.rb
  )
  gem.require_paths << 'lib'
  gem.bindir = 'bin'
  gem.executables << 'calcexam'
  gem.add_dependency('rainbow')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('mocha')
  gem.add_development_dependency('aruba', '~> 0.4.6')
end
