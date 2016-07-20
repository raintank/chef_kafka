# disk
default[:chef_kafka][:kafka_disk] = "/dev/sdb"

# zookeepers and zookeeper search
default[:chef_kafka][:zookeepers] = []
default[:chef_kafka][:zookeeper_search] = "chef_environment:#{node.chef_environment} AND tags:zookeeper"
default[:chef_kafka][:include_zookeeper] = false

# group
default[:chef_kafka][:group_id] = "#{node.chef_environment}_kafka"

# various kafka cookbook options to set
default[:kafka][:init_style] = :systemd
default[:kafka][:broker][:reserved_broker_max_id] = 40000000
default[:kafka][:broker][:port] = 9092

default[:java][:install_flavor] = "oracle"
default[:java][:jdk_version] = "8"
default[:java][:oracle][:accept_oracle_download_terms] = true

# kafka version overrides
override[:kafka][:version] = "0.10.0.0"
override[:kafka][:checksum] = "bee90d7287647119cf78948a7379729565ee0275eb67acfc1b0653b62a8246ee"
override[:kafka][:md5_checksum] = "f6a887ba61341071ec26c392c2a5d363"
override[:kafka][:scala_version] = "2.11"
