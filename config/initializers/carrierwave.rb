CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id      => 'AKIAJ76CMC4BZSB2J7OQ',
    :aws_secret_access_key  => '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',
    :region                => 'eu-central-1'

  }
  config.fog_directory    = 'indiano'
end
