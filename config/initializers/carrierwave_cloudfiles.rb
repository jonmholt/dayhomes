# SNET Note:
# https://github.com/jnicklas/carrierwave/wiki/How-To:-Use-Rackspace-ServiceNet-(snet)-to-transfer-from-CloudServer-to-CloudFiles
cloudfiles_config = YAML.load_file("#{Rails.root}/config/rackspace_cloudfiles.yml")[Rails.env].with_indifferent_access

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider             => 'Rackspace',
    :rackspace_username   => cloudfiles_config[:username],
    :rackspace_api_key    => cloudfiles_config[:api_key],
    :rackspace_servicenet => Rails.env.production? # NOTE - Can only be used on rackspace VPS, see SNET note at top.
  }
  config.fog_directory = cloudfiles_config[:container]
  config.fog_host = cloudfiles_config[:cdn_url]

  # hack fix for windows machine due to tmp file permission error
  # per https://github.com/jnicklas/carrierwave/issues/220/
  if ENV['RAILS_ENV'] != 'production' || ENV['RAILS_ENV'] != 'test'
    config.delete_tmp_file_after_storage = false
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/