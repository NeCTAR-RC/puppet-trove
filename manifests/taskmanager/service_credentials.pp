# The trove::taskmanager::service_credentials class helps configure auth settings
#
# == Parameters
# [*auth_url*]
#   (optional) the keystone public endpoint
#   Defaults to undef
#
# [*region_name*]
#   (optional) the keystone region of this node
#   Optional. Defaults to 'RegionOne'
#
# [*username*]
#   (optional) the keystone user for trove services
#   Defaults to 'trove'
#
# [*password*]
#   (required) the keystone password for trove services
#
# [*project_name*]
#   (optional) the keystone tenant name for trove services
#   Defaults to 'services'
#
# [*project_domain_name*]
#   (optional) the keystone project domain name for trove services
#   Defaults to 'Default'
#
#  [*user_domain_name*]
#   (optional) the keystone user domain name for trove services
#   Defaults to 'Default'
#
class trove::taskmanager::service_credentials (
  $password            = $::os_service_default,
  $auth_url            = 'http://127.0.0.1:5000/v3',
  $region_name         = 'RegionOne',
  $username            = 'trove',
  $project_name        = 'services',
  $project_domain_name = 'Default',
  $user_domain_name    = 'Default',
) {

  include trove::deps

  if is_service_default($password) {
    fail('trove::taskmanager::service_credentials::password should be set')
  }

  trove_config {
    'service_credentials/auth_url':            value => $auth_url;
    'service_credentials/username':            value => $username;
    'service_credentials/password':            value => $password, secret => true;
    'service_credentials/project_name':        value => $project_name;
    'service_credentials/project_domain_name': value => $project_domain_name;
    'service_credentials/user_domain_name':    value => $user_domain_name;
    'service_credentials/region_name':         value => $region_name;
  }

}
