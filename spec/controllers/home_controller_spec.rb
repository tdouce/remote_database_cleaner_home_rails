require 'spec_helper'

describe RemoteDatabaseCleanerHomeRails::HomeController do

  routes { RemoteDatabaseCleanerHomeRails::Engine.routes }

  let(:fake_class) { Class.new }

  before do 
    stub_const('DatabaseCleaner', fake_class)
  end

  describe '#create' do

    it 'should clean database with strategy truncation' do
      expect(DatabaseCleaner).to receive(:strategy=).with(:truncation)
      expect(DatabaseCleaner).to receive(:clean)
      post :create, {}
    end
  end
end
