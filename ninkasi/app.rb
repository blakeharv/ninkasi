class Ninkasi < Padrino::Application

  # Access Application cache from anywhere
  # BeerBud.cache['val'] = 'test cache'
  # puts BeerBud.cache['val']
  # BeerBud.cache.delete('val')
  # BeerBud.cache.flush

  register Padrino::Cache
  enable :caching

  set :cache, Padrino::Cache.new(:LRUHash)


  error 400..410 do
    erb "This page doesn't exist"
  end

  error 500..505 do
    erb "BOOM!"
  end

end