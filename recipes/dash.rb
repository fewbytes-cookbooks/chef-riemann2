#
# Cookbook Name:: riemann2
# Recipe::dash
#
include_recipe 'runit'
include_recipe 'riemann2::default'

chef_gem 'riemann-dash' do
  action :install
end

directory '/opt/riemann2/dash' do
  owner node.riemann.system.user
  group node.riemann.system.group
  mode '0755'
  recursive true
  action :create
end

%w( config.rb config.json).each do |config_file|
  template "/opt/riemann2/dash/#{config_file}" do
    source "#{config_file}.erb"
    owner node.riemann.system.user
    group node.riemann.system.group
    mode '0644'
  end
end

runit_service 'riemann-dash'
