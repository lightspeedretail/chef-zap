# encoding: utf-8
#
# Cookbook Name:: zap
# HWRP:: directory
#
# Author:: Joseph J. Nuspl Jr. <nuspl@nvwls.com>
#
# Copyright:: 2014, Joseph J. Nuspl Jr.
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

require File.expand_path('default.rb', File.dirname(__FILE__))
#require_relative 'default.rb'

# zap_directory 'DIR'
class Chef
  # resource
  class Resource::ZapDirectory < Resource::Zap
    def initialize(name, run_context = nil)
      super

      # Set the resource name and provider
      @resource_name = :zap_directory
      @provider = Provider::ZapDirectory
      @klass = [Chef::Resource::File, Chef::Resource::Template]
    end
  end

  # provider
  class Provider::ZapDirectory < Provider::Zap
    def collect
      ::Dir.glob(::File.join(@new_resource.name, @new_resource.pattern))
    end
  end
end
