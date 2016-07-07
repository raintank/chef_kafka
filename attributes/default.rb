# disk
default[:chef_kafka][:kafka_disk] = "/dev/sdb"

# zookeepers and zookeeper search
default[:chef_kafka][:zookeepers] = []
default[:chef_kafka][:zookeeper_search] = "chef_environment:#{node.chef_environment} AND tags:zookeeper"

# group
default[:chef_kafka][:group_id] = "#{node.chef_environment}_kafka"

# various kafka cookbook options to set
default[:kafka][:init_style] = :upstart

default[:java][:install_flavor] = "oracle"
default[:java][:jdk_version] = "8"
default[:java][:oracle][:accept_oracle_download_terms] = true
