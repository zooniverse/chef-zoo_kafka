#
# Cookbook Name:: zoo-kafka
# Recipe:: ec2 
#
# Copyright 2014, Zooniverse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "aws"

devices = []

node['kafka']['number_of_brokers'].times do |n|
  devices.push("/dev/xvd#{("f".."z").to_a[n]}")

  log "Attaching: #{devices[n]}" do
    level :info
  end
  
  aws_ebs_volume "kafka_data-#{n}" do
    size 80
    device devices[n]
    volume_type "io1"
    action [ :create, :attach ]
    piops 400
  end
end

node.override['kafka']['devices'] = devices

log "Devices: #{node['kafka']['devices'].join(",")}" do
  level :info
end

include_recipe "zoo-kafka::default"
