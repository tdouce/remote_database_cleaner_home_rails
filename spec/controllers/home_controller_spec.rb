require 'spec_helper'

class DatabaseCleaner
  def self.strategy=(strategy)
    strategy
  end

  def self.clean
    true
  end
end

describe RemoteDatabaseCleanerHomeRails::HomeController do

  routes { RemoteDatabaseCleanerHomeRails::Engine.routes }

  before do 
    RemoteDatabaseCleanerHomeRails.enable! 
    RemoteDatabaseCleanerHomeRails.strategy = :truncation
  end

  describe '#create' do
    it 'should clean database with strategy truncation' do
      expect(DatabaseCleaner).to receive(:strategy=).with(:truncation)
      expect(DatabaseCleaner).to receive(:clean)
      post :create, {}
    end

    it 'should skip :authentication and :another_authentication methods defined in ApplicationController' do
      post :create, {}
      expect(response).to_not redirect_to("/401.html")
    end

    it 'should return status code 403 when RemoteDatabaseCleanerHomeRails is not enabled' do
      RemoteDatabaseCleanerHomeRails.disable!
      post :create, {}
      expect(response.status).to eq(403)
    end

    it 'should return status code 200 when RemoteDatabaseCleanerHomeRails is enabled' do
      RemoteDatabaseCleanerHomeRails.enable!
      post :create, {}
      expect(response.status).to eq(200)
    end

    it 'should be able to configure cleaning strategy' do
      RemoteDatabaseCleanerHomeRails.strategy = :transaction
      expect(DatabaseCleaner).to receive(:strategy=).with(:transaction)
      post :create, {}
    end
  end
end
