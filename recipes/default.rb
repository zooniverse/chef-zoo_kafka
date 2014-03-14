#
# Cookbook Name:: zoo-kafka
# Recipe:: default
#
# Copyright (C) 2014 The Zooniverse
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
include_recipe 'zoo-base'
include_recipe 'kafka'

node['kafka']['number_of_brokers'].times do |n|
  monit_monitrc "kafka-#{n}" do
    template_source "kafka.monitrc.erb"
    variables({
      pid_file_dir: node['kafka']['install_dir'],
      n: n
    })
  end
end
