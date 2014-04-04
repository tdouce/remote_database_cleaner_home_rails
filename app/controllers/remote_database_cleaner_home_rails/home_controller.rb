module RemoteDatabaseCleanerHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteDatabaseCleanerHomeRails.skip_before_filter
    
    def clean 
      if RemoteDatabaseCleanerHomeRails.enabled?
        DatabaseCleaner.strategy = strategy 
        DatabaseCleaner.clean
        render json: {response: 200}
      else
        forbidden = 403
        render json: { status: forbidden }, status: forbidden
      end
    end

    private

    def strategy
      RemoteDatabaseCleanerHomeRails.strategy
    end
  end
end
