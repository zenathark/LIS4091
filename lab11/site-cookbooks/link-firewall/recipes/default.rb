#
# Cookbook Name:: site-cookbooks/web-firewall
# Recipe:: default
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'iptables' do
  action :install
end

template '/tmp/iptables.save' do
  source 'iptables.erb'
  owner 'root'
  group 'root'
  mode 00600
  cookbook 'link-firewall'
end

execute 'iptables-restore -c < /tmp/iptables.save' do
  user 'root'
  command 'iptables-restore -c < /tmp/iptables.save'
end
