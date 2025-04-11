#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do

  context 'When all attributes are default, on Ubuntu 24.04' do

    platform 'ubuntu', '24.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs the apache2 package' do
      expect(chef_run).to install_package('apache2')
    end

    it 'starts the apache2 service' do
      expect(chef_run).to start_service('apache2')
      expect(chef_run).to enable_service('apache2')
    end

    it 'creates the index file' do
      expect(chef_run).to render_file('/var/www/html/index.html').with_content('<h1>Welcome Home!</h1>')
    end

  end

  context 'When all attributes are default, on CentOS 8' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/main/PLATFORMS.md
    platform 'centos', '8'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs the httpd package' do
      expect(chef_run).to install_package('httpd')
    end

    it 'creates the index file' do
      expect(chef_run).to render_file('/var/www/html/index.html').with_content('<h1>Welcome Home!</h1>')
    end

    it 'starts the httpd service' do
      expect(chef_run).to start_service('httpd')
      expect(chef_run).to enable_service('httpd')
    end

  end
end
