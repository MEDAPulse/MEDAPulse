if Rails.env.development?
  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://localhost:6379', :namespace => 'langthang' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { :url => 'redis://localhost:6379', :namespace => 'langthang' }
  end
else
  # for use with Ninefold
  Sidekiq.configure_server do |config|
    config.redis = { :url => ENV['REDIS_URL'], :namespace => 'langthang' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { :url => ENV['REDIS_URL'], :namespace => 'langthang' }
  end
end