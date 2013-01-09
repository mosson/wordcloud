# callback先のドメインを現在のものに合わせる => reverse proxy用
OmniAuth.config.full_host = lambda do |env|
  scheme         = env['rack.url_scheme']
  local_host     = env['HTTP_HOST']
  forwarded_host = env['HTTP_X_FORWARDED_HOST']
  forwarded_host.blank? ? "#{scheme}://#{local_host}" : "#{scheme}://#{forwarded_host}"
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_ACCESS_TOKEN"], ENV["TWITTER_SECRET_KEY"]
  provider :facebook, ENV["FACEBOOK_ACCESS_TOKEN"], ENV["FACEBOOK_SECRET_KEY"]
end