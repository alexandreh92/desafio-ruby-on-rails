Sidekiq.configure_server do |config|
  redis_url = Rails.env.development? ? 'redis://localhost:6379/' : ENV['REDIS_URL']
  config.redis = { url: redis_url }
end
