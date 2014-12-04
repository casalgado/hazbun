
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET"],
    :endpoint               => 'https://hazbun.app-bucket.s3-website-sa-east-1.amazonaws.com'                         # required
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                     # required
end

