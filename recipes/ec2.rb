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

node['kafka']['number_of_brokers'].times do |n|
  node.default['kafka']['devices'] = '/dev/xvdf'

  aws_ebs_volume "zoo_data" do
    size 80
    device node['kafka']['data_device']
    volume_type "io1"
    piops 400
  end
end
