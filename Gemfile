source 'https://rubygems.org'

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

group :development, :test do
  gem 'puppet-lint', '>=0.3.2'
  gem 'rake'
  gem 'rspec-puppet', '>= 0.1.3'
  gem 'puppetlabs_spec_helper', :require => false
  gem 'rspec-system-puppet'
  gem 'rspec-system-serverspec', :require => false
  gem 'vagrant-wrapper',         :require => false
end
