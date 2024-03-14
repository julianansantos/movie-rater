require 'sidekiq'

Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'] } # Configuração do Redis para o Sidekiq no servidor
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'] } # Configuração do Redis para o Sidekiq no cliente
  end
