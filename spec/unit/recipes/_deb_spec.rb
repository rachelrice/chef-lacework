#
# Cookbook:: chef-lacework
# Spec:: _deb
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef-lacework::_deb' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'
    default_attributes['chef-lacework']['deb_package']['url'] = 'https://mycompany.lacework.net/mgr/v1/download/fff/lacework_latest_amd64.deb'

    describe 'creates a remote_file with the default action' do
      it { is_expected.to create_remote_file('/tmp/lacework_latest_amd64.deb') }
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
