module RemoteDatabaseCleanerHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteDatabaseCleanerHomeRails.skip_before_filters
    
    def create 
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
      render json: {response: 200}
    end
  end
end
