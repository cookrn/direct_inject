begin
  require 'bundler/setup'
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE =
  File.expand_path \
    '../test/dummy/Rakefile',
    __FILE__

load 'rails/tasks/engine.rake'

require 'rake/testtask'

Rake::TestTask.new :test do | t |
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test
