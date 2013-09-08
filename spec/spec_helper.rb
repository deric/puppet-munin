require 'puppet'
require 'rspec'
require 'rspec-puppet'
require 'vagrant-wrapper'

require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'
require 'rspec-system-serverspec/helpers'
include Serverspec::Helper::RSpecSystem
include Serverspec::Helper::DetectOS
include RSpecSystemPuppet::Helpers

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

# recommend version by rspec-system-puppet
vw = VagrantWrapper.new(">= 1.2.2")

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.mock_with :mocha

  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.include RSpecSystemPuppet::Helpers

  # This is where we 'setup' the nodes before running our tests
  c.before :suite do
    # Install puppet
    puppet_install

    # Install modules and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'munin')
  end
end

