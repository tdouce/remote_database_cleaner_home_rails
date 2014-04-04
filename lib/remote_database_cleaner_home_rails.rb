require "remote_database_cleaner_home_rails/engine"

module RemoteDatabaseCleanerHomeRails
  OFF     = false
  ON      = true

  def self.strategy=(strategy)
    config.strategy = strategy
  end

  def self.strategy
    config.strategy
  end

  def self.skip_before_filter
    filters = config.skip_before_filter
    filters.present? ? [filters].flatten.map(&:to_sym) : nil
  end

  def self.config(config = RemoteDatabaseCleanerHomeRails::Engine.config.remote_database_cleaner_home_rails)
    config
  end

  def self.configure
    yield config
  end

  def self.enable!
    config.enable = ON 
  end

  def self.disable!
    config.enable = OFF 
  end

  def self.enabled?
    config.enable == ON
  end

  def self.reset
    config.enable = OFF
    config.skip_before_filter = nil
  end
end
