# Repository

default['bareos']['url'] = 'http://download.bareos.org/bareos/release'

# Used to have 'latest' as default, had potential update dangers
# default['bareos']['version'] = 'latest' <--- Could be dangerous, ***CAUTION***
default['bareos']['version'] = '14.2' # <--- Latest version as of 6-26-15

if platform_family?('rhel')
  default['bareos']['yum_repository'] = 'bareos'
  default['bareos']['description'] = 'Backup Archiving Recovery Open Sourced Current stable'
end

case node['platform']
when 'ubuntu'
  default['bareos']['baseurl'] = "#{node['bareos']['url']}/#{node['bareos']['version']}/xUbuntu_#{node['platform_version']}/"
  default['bareos']['gpgkey'] = "#{node['bareos']['url']}/#{node['bareos']['version']}/xUbuntu_#{node['platform_version']}/Release.key"
when 'centos'
  default['bareos']['baseurl'] = "#{node['bareos']['url']}/#{node['bareos']['version']}/CentOS_6/"
  default['bareos']['gpgkey'] = "#{node['bareos']['url']}/#{node['bareos']['version']}/CentOS_6/repodata/repomd.xml.key"
when 'debian'
  default['bareos']['baseurl'] = "#{node['bareos']['url']}/#{node['bareos']['version']}/Debian_7.0/"
  default['bareos']['gpgkey'] = "#{node['bareos']['url']}/#{node['bareos']['version']}/Debian_7.0/Release.key"
end

# Database
default['bareos']['database_type'] = 'postgresql' # postgresql/mysql
default['bareos']['dbdriver'] = 'postgresql'
default['bareos']['dbname'] = 'bareos'
default['bareos']['dbuser'] = 'bareos'
default['bareos']['dbpassword'] = ''

# Clients list
default['bareos']['clients'] = []
default['bareos']['enable_vfulls'] = false # Needs more work within host template
default['bareos']['host_pools'] = false
default['bareos']['custom_host_pools'] = false
default['bareos']['host_full_pool'] = 'test-pool-Full'
default['bareos']['host_incremental_pool'] = 'test-pool-Inc'
default['bareos']['host_differential_pool'] = 'test-pool-Diff'

# Storage Daemon
default['bareos']['tape'] = false

# Director
default['bareos']['dir_port'] = 9101
default['bareos']['dir_max_concurrent_jobs'] = 20
default['bareos']['dir_subscription'] = nil
default['bareos']['dir_subs'] = nil
