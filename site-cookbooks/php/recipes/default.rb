#
# Cookbook Name:: php
# Recipe:: default
#

%w{
  php5
  php5-fpm
  php5-gd
}.each do |pkg|
  package pkg do
    action :install
  end
end

service "php5-fpm" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true, :stop => true
  action [:enable, :start]
end

