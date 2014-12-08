CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') 
  config.cache_dir = "#{Rails.root}/tmp/uploads" 

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_KEY'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET'],                     # required
    :region                 => 'us-west-2'                 # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'directory'                             # required
end

