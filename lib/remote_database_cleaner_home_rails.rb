require "remote_database_cleaner_home_rails/engine"

module RemoteDatabaseCleanerHomeRails
  OFF     = false
  ON      = true
  @enable = OFF

  mattr_accessor :skip_before_filter
  mattr_accessor :strategy

  def self.strategy
    @@strategy.to_sym
  end

  def self.skip_before_filters
    skip_before_filter.present? ? [skip_before_filter].flatten.map {|a| a.to_sym} : nil
  end

  def self.enable!
    @enable = ON 
  end

  def self.disable!
    @enable = OFF 
  end

  def self.enabled?
    @enable == ON 
  end

  def self.reset
    @enable = OFF 
  end
end
