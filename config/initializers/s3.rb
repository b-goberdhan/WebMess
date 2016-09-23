
=begin
CarrierWave.configure do |config|


  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => '<your key goes here>',            # required
    :aws_secret_access_key  => '<your secret key goes here>',     # required
    :region                 => 'eu-west-1'                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = '<bucket name goes here>'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

=end

CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider				=> 'AWS',
		:aws_access_key_id 		=> ENV["S3_KEY"],
		:aws_secret_access_key	=> ENV["S3_SECRET_KEY"]
	}
	config.fog_directory = ENV["S3_BUCKET"]
end