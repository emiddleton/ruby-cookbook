#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gems = {
  'dev-lang/ruby'      => '1.8.7_p352',  # system
  'dev-ruby/rdoc'      => '3.11',        # system
    'dev-ruby/session'   => '2.4.0',     # system
  'dev-ruby/rake'      => '0.9.2.2',     # system
    'dev-libs/libxslt'   => '1.1.26-r1', # system
  'dev-ruby/bundler'   => '1.0.21',      # system

}

case node.platform
when 'gentoo'
  portage_package_unmask "=dev-ruby/rake-0.9.2.2"
  gems.each do |package_name,package_version|
    portage_package_keywords "=#{package_name}-#{package_version}"
    package package_name do
      version package_version
    end
  end
when 'centos'
  gems.each do |package_name,package_version|
    # remove package groups from names
    package package_name.gsub(/[^\/]+\//,'') do
      version package_version
    end
  end
end
