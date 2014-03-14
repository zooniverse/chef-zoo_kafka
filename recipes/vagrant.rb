node.override['set_fqdn'] = "*.zooniverse.local"
node.override['monit']['mail_alerts'] = false
node.override['kafka']['zookeeper_hosts'] = [
  "zk1.zooniverse.local:2181",
  "zk2.zooniverse.local:2181",
  "zk3.zooniverse.local:2181"
]

include_recipe "zoo-kafka::default"
