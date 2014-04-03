module RemoteDatabaseCleanerHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteDatabaseCleanerHomeRails.skip_before_filters
    
    def create 
      if RemoteDatabaseCleanerHomeRails.enabled?
        DatabaseCleaner.strategy = :truncation
        DatabaseCleaner.clean
        render json: {response: 200}
      else
        render json: { status: 403 }, status: 403
      end
    end
  end
end
