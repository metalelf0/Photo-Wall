# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     :provider               => 'AWS',
#     :aws_access_key_id      => 'AKIAIR4FYKRZD3QUFCBQ',
#     :aws_secret_access_key  => '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'
#   }
#   config.fog_directory  = 'extendhealth-production'
# end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => '',
    :aws_secret_access_key  => '',
  }
  config.fog_directory  = 'photo_wall'
end