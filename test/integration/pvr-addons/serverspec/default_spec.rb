require 'spec_helper'
require 'json'

describe 'kodi::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  let(:node) { JSON.parse(IO.read(File.join(ENV["TEMP"] || "/tmp", "kitchen/chef_node.json"))) }

  describe ppa('team-xbmc/ppa') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('kodi') do
    it { should be_installed }
  end

  it "should install any addons listed in node['kodi']['addons']" do
    node['normal']['kodi']['addons'].each do |addon|
      expect( package(addon) ).to be_installed
    end
  end
end
