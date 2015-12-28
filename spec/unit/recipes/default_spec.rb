#
# Cookbook Name:: kodi
# Spec:: default
#
# Copyright (C) 2015  James Cuzella
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


require 'spec_helper'

describe 'kodi::default' do
  context 'When all attributes are default, on platform: ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner
      runner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.set['lsb']['codename'] = 'trusty'
        node.set['platform_family'] = 'debian'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
