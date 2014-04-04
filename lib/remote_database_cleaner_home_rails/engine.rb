module RemoteDatabaseCleanerHomeRails
  class Engine < ::Rails::Engine
    isolate_namespace RemoteDatabaseCleanerHomeRails

     config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.remote_database_cleaner_home_rails = ActiveSupport::OrderedOptions.new

    initializer "remote_database_cleaner_home_rails.environment" do |app|
      options = app.config.remote_database_cleaner_home_rails
      options.skip_before_filter ||= nil
      options.enable ||= false 
      options.strategy ||= :truncation
    end
  end
end
