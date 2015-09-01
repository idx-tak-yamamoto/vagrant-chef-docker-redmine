#
# Cookbook Name:: dockersetup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "yum-update" do
  user "root"
  command "yum -y update"
  action :run
end

package "epel-release" do
     action :install
end

package "docker-io" do
     action :install
end

service "docker" do
  action [:enable, :start] 
  supports :start => true, :status => true, :restart => true, :reload => true
end


execute "pull_redmine" do
  user "root"
  command "docker pull sameersbn/redmine:latest"
  action :run
not_if "docker images | grep 'sameersbn/redmine'"
end

execute "pull_mysql" do
  user "root"
  command "docker pull sameersbn/mysql:latest"
  action :run
not_if "docker images | grep 'sameersbn/mysql'"
end

execute "docker_run_mysql" do
  user "root"
  command "docker run --name=mysql -d -e 'DB_NAME=redmine_production' -e 'DB_USER=redmine' -e 'DB_PASS=password' sameersbn/mysql:latest"
  action :run
not_if "docker ps | grep 'sameersbn/mysql'"
end

execute "docker_run_redmine" do
  user "root"
  command "docker run --name=redmine -d -p 80:80 --link mysql:mysql sameersbn/redmine:latest"
  action :run
not_if "docker ps | grep 'sameersbn/redmine'"
end
