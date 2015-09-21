Devise.setup do |config|
  config.navigational_formats = [:json]
  config.password_length = 6..72
end
