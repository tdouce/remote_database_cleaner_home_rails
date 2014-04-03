module RemoteDatabaseCleanerHomeRails
  class HomeController < ApplicationController 

    
    def create 
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
      render json: {response: 200}
    end
  end
end
