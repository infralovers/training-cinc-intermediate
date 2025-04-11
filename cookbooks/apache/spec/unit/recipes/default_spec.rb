#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do

  context 'When all attributes are default, on Ubuntu 24.04' do

    platform 'ubuntu', '24.04'

    # Step into the custom resource to test its internal behavior
    # step_into ['apache_vhost']

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


    describe 'for the default site' do
      it 'writes out a new home page' do
        expect(chef_run).to render_file('/var/www/html/index.html').with_content('<h1>Welcome Home!</h1>')
      end
    end

    describe 'for the admin site' do
      it 'creates the directory' do
        expect(chef_run).to create_directory('/var/www/admins/html')
      end

      it 'creates the configuration' do
        expect(chef_run).to render_file('/etc/apache2/sites-enabled/admins.conf').with_content('Listen 8080')
      end

      it 'creates a new home page' do
        expect(chef_run).to render_file('/var/www/admins/html/index.html').with_content('<h1>Welcome admins!</h1>')
      end

    end

  end

end
