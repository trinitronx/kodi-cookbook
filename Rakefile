#!/usr/bin/env rake

# http://acrmp.github.com/foodcritic/
require 'foodcritic'

task :default => ['unit:knife', 'unit:foodcritic', 'unit:chefspec']
task :test => [:default]

desc 'Run Lint, Unit, and Style tests'
namespace :unit do

  FoodCritic::Rake::LintTask.new do |t|
    t.options = { :fail_tags => ['correctness'] }
  end

# http://berkshelf.com/
  desc "Install Berkshelf to local cookbooks path"
  task :berks do
    sh %{berks install --path cookbooks}
  end

# http://wiki.opscode.com/display/chef/Managing+Cookbooks+With+Knife#ManagingCookbooksWithKnife-test
  desc "Test cookbooks via knife"
  task :knife do
    cookbook_path = ENV['TRAVIS_BUILD_DIR'] ? ENV['TRAVIS_BUILD_DIR'] + '/../' : '.././'
    sh "knife cookbook test -c test/.chef/knife.rb -o #{cookbook_path} -a"
  end

# https://github.com/acrmp/chefspec
  desc "Run ChefSpec Unit Tests"
  task :chefspec do
    sh %{rspec --color}
  end
end

desc 'Run Test Kitchen integration tests'
namespace :integration do
  desc 'Run integration tests with kitchen-docker'
  task :docker do
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.docker.yml')
    Kitchen::Config.new(loader: @loader).instances.each do |instance|
      instance.test(:always)
    end
  end
end
