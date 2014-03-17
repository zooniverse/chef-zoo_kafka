override['java']['jdk_version'] = 7

override['kafka']['number_of_brokers'] = 3
override['kafka']['ad_hostname'] = "kafka1.zooniverse.org"
override['kafka']['zookeeper_hosts'] = [
  "zk1.zooniverse.org:2181",
  "zk2.zooniverse.org:2181",
  "zk3.zooniverse.org:2181"
]
