Padrino.configure_apps do
  enable :reload
  set :sessions, true
end

Padrino.mount('Ninkasi', :app_file => Padrino.root('ninkasi/app.rb')).to('/')
