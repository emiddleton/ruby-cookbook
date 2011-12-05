portage_overlay 'chef-gentoo-bootstrap-overlay'
{
    'dev-ruby/columnize'          => '0.3.4',  # system
    'dev-ruby/require_relative'   => '1.0.2',  # system
    'dev-ruby/linecache'          => '0.46',   # system
    'dev-ruby/ruby-debug-base'    => '0.10.4', # system
  'dev-ruby/ruby-debug'         => '0.10.4'    # system
}.each do |package_name,package_version|
  portage_package_keywords "=#{package_name}-#{package_version}"
end
package 'dev-ruby/ruby-debug' do
  version '0.10.4'
end
