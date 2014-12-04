
CarrierWave.configure do |config|

	if ENV['RAILS_ENV'] != 'production'
      config.delete_tmp_file_after_storage = false  
  end

  config.fog_credentials = {
    :provider               => 'AWS',                                # required
    :aws_access_key_id      => ENV["AWS_ACCESS"],                    # required
    :aws_secret_access_key  => ENV["AWS_SECRET"],
    :region                 => 'sa-east-1', 
    :endpoint               => 'https://hazbun-app-bucket.s3-website-us-west-2.amazonaws.com'                         # required
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                          # required
end

