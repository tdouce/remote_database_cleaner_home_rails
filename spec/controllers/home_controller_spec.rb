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

  describe '#create' do
    it 'should clean database with strategy truncation' do
      expect(DatabaseCleaner).to receive(:strategy=).with(:truncation)
      expect(DatabaseCleaner).to receive(:clean)
      post :create, {}
    end
  end
end
