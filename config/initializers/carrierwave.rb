CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_KEY'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET'],                     # required
    :region                 => ENV['S3_REGION']
  }

  config.fog_directory  = ENV['AWS_S3_BUCKET']                             # required

end

