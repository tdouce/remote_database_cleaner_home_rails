require 'spec_helper'

describe RemoteDatabaseCleanerHomeRails do

  describe '.enable!' do
    it 'should return true when enabled' do
      RemoteDatabaseCleanerHomeRails.enable!
      expect(RemoteDatabaseCleanerHomeRails.enabled?).to be_true
    end
  end

  describe '.enabled?' do
    it 'should return false when disabled' do
      expect(RemoteDatabaseCleanerHomeRails.enabled?).to be_false
    end
  end

  describe '.disable!' do
    it 'should disable' do
      RemoteDatabaseCleanerHomeRails.enable!
      RemoteDatabaseCleanerHomeRails.disable!
      expect(RemoteDatabaseCleanerHomeRails.enabled?).to be_false
    end
  end
end
