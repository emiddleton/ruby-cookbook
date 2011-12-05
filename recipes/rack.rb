include_recipe 'ruby'
gems = {
    'app-admin/eselect-rack'    => '0.1',       # overlay
  'dev-ruby/rack'             => '1.2.4',       # system
}
gems.each do |package_name,package_version|
  portage_package_keywords "=#{package_name}-#{package_version}"
end
gems.each do |package_name,package_version|
  package package_name do
    version package_version
  end
end
