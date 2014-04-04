RemoteDatabaseCleanerHomeRails::Engine.routes.draw do
  post '/home/clean' => 'home#clean'
end
