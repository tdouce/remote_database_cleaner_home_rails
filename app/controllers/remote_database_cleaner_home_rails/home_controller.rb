module RemoteDatabaseCleanerHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteDatabaseCleanerHomeRails.skip_before_filter
    
    def create 
      if RemoteDatabaseCleanerHomeRails.enabled?
        DatabaseCleaner.strategy = strategy 
        DatabaseCleaner.clean
        render json: {response: 200}
      else
        render json: { status: 403 }, status: 403
      end
    end

    private

    def strategy
      RemoteDatabaseCleanerHomeRails.strategy
    end
  end
end
