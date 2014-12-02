Yummly.configure do |config|
  config.app_id = ENV['yummly_application_id']
  config.app_key = ENV['yummly_application_key']
  config.use_ssl = true # Default is false
end