CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id      => 'AKIAJ76CMC4BZSB2J7OQ',
    :aws_secret_access_key  => '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',
    :region                => 'eu-central-1'
  }

  # For testing, upload files to local `tmp` folder.

                  # To let CarrierWave work on heroku

  config.fog_directory    = 'indiano'
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
