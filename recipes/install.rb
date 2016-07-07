#
# Cookbook Name:: chef_kafka
# Recipe:: install
#
# Copyright (C) 2016 Raintank, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"
include_recipe 'kafka::_defaults'
include_recipe 'kafka::_setup'
unless node[:chef_base][:is_img_build]
  include_recipe "chef_kafka::disks"
end
zks = if Chef::Config[:solo]
    node['chef_kafka']['zookeepers'].join(",")
  else
    z = search("node", node['chef_kafka']['zookeeper_search']).map { |c| c.fqdn } || node['chef_kafka']['zookeepers']
    z.join(",")
  end
node.set['kafka']['broker']['zookeeper_connect'] = zks
node.set['kafka']['broker']['group_id'] = node['chef_kafka']['group_id']
include_recipe 'kafka::_install'
include_recipe 'kafka::_configure'
tag("kafka")
