# == Class: trove::dns
#
# Setup and configure trove dns.
#
# === Parameters
#
# [*dns_account_id*]
#   Keystone auth project ID
#
# [*dns_username*]
#   Keystone auth username
#
# [*dns_passkey*]
#   Keystone auth password
#
# [*dns_domain_name*]
#   Name of zone in designate
#
# [*dns_domain_id*]
#   ID of zone in designate
#
# [*dns_ttl*]
#   (optional) TTL to use when creating records
#   Defaults to 3600
#
# [*dns_driver*]
#   (optional) Default driver to use for dns.
#   Defaults to 'trove.dns.designate.driver.DesignateDriverV2'.
#
# [*dns_instance_entry_factory*]
#   (optional) Driver to use for instance entries
#   Defaults to 'trove.dns.designate.driver.DesignateInstanceEntryFactory'.
#
# [*dns_service_type*]
#   (optional) Service type for designate as specified in service catalog
#   Defaults to 'dns'.
#
# [*dns_user_domain_id*]
#   (optional) Keystone auth user domain ID
#   Defaults to 'default'.
#
# [*dns_project_domain_id*]
#   (optional) Keystone auth project domain ID
#   Defaults to 'default'.
#
# [*dns_time_out*]
#   (optional) instance ip creation timeout
#   Defaults to 120.
#
class trove::dns (
  $dns_account_id,
  $dns_auth_url,
  $dns_username,
  $dns_passkey,
  $dns_domain_name,
  $dns_domain_id,
  $dns_user_domain_id         = 'default',
  $dns_project_domain_id      = 'default',
  $dns_ttl                    = 3600,
  $dns_driver                 = 'trove.dns.designate.driver.DesignateDriverV2',
  $dns_instance_entry_factory = 'trove.dns.designate.driver.DesignateInstanceEntryFactory',
  $dns_service_type           = 'dns',
  $dns_time_out               = 120,
) {

  include ::trove::deps

  trove_config {
    'DEFAULT/trove_dns_support':          value => true;
    'DEFAULT/dns_auth_url':               value => $dns_auth_url;
    'DEFAULT/dns_account_id':             value => $dns_account_id;
    'DEFAULT/dns_username':               value => $dns_username;
    'DEFAULT/dns_passkey':                value => $dns_passkey;
    'DEFAULT/dns_domain_name':            value => $dns_domain_name;
    'DEFAULT/dns_domain_id':              value => $dns_domain_id;
    'DEFAULT/dns_ttl':                    value => $dns_ttl;
    'DEFAULT/dns_driver':                 value => $dns_driver;
    'DEFAULT/dns_instance_entry_factory': value => $dns_instance_entry_factory;
    'DEFAULT/dns_service_type':           value => $dns_service_type;
    'DEFAULT/dns_user_domain_id':         value => $dns_user_domain_id;
    'DEFAULT/dns_project_domain_id':      value => $dns_project_domain_id;
    'DEFAULT/dns_time_out':               value => $dns_time_out;
  }

  trove_taskmanager_config {
    'DEFAULT/trove_dns_support':          value => true;
    'DEFAULT/dns_auth_url':               value => $dns_auth_url;
    'DEFAULT/dns_account_id':             value => $dns_account_id;
    'DEFAULT/dns_username':               value => $dns_username;
    'DEFAULT/dns_passkey':                value => $dns_passkey;
    'DEFAULT/dns_domain_name':            value => $dns_domain_name;
    'DEFAULT/dns_domain_id':              value => $dns_domain_id;
    'DEFAULT/dns_ttl':                    value => $dns_ttl;
    'DEFAULT/dns_driver':                 value => $dns_driver;
    'DEFAULT/dns_instance_entry_factory': value => $dns_instance_entry_factory;
    'DEFAULT/dns_service_type':           value => $dns_service_type;
    'DEFAULT/dns_user_domain_id':         value => $dns_user_domain_id;
    'DEFAULT/dns_project_domain_id':      value => $dns_project_domain_id;
    'DEFAULT/dns_time_out':               value => $dns_time_out;
  }
}
