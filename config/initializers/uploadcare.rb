Uploadcare::Rails::Engine.configure do
  config.uploadcare.public_key = ENV['UPLOADCARE_PUBLIC_KEY'] || 'demopublickey'
  config.uploadcare.private_key = ENV['UPLOADCARE_SECRET_KEY'] || 'demoprivatekey'
  config.uploadcare.widget_version = '0.6.4.2'
end
