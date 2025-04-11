#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

package 'apache2'

file '/var/www/html/index.html' do
  content '<h1>Welcome home!</h1>'
end

directory '/var/www/admins/html' do
  recursive true
  mode '0755'
end

template '/etc/apache2/sites-enabled/admins.conf' do
  source 'conf.erb'
  mode '0644'
  variables(document_root: '/var/www/admins/html', port: 8080)
  notifies :restart, 'service[apache2]'
end

file '/var/www/admins/html/index.html' do
  content '<h1>Welcome admins!</h1>'
end

service 'apache2' do
  action [:enable, :start]
end
