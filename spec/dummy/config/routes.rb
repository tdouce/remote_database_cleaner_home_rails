Rails.application.routes.draw do

  mount RemoteDatabaseCleanerHomeRails::Engine => "/remote_database_cleaner_home_rails"
end
