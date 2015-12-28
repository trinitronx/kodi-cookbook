require 'spec_helper'

describe 'kodi::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe ppa('team-xbmc/ppa') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('kodi') do
    it { should be_installed }
  end

  describe package('kodi-pvr-mythtv') do
    it { should be_installed }
  end
end
