# RemoteDatabaseCleanerRails

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'remote_database_cleaner_home_rails'
end
```


And then execute:

    $ bundle


## Usage

Configure in `config/environments/*.rb`

Activate remote_database_cleaner_home_rails to run in the environments in which it is intended to
run. For example, if remote_database_cleaner_home_rails is included in `group
:test` (most common), then activate in `config/environments/test.rb`

```ruby
YourApplication::Application.configure do
  ...
  config.remote_database_cleaner_home_rails.enable = true
  ...
end
```

Configure in `config/routes.rb`

```ruby
YourApplication::Application.routes.draw do
  if defined?(RemoteDatabaseCleanerHomeRails::Engine)
    mount RemoteDatabaseCleanerHomeRails::Engine, at: '/remote_factory_girl' 
  end
end
```

Configure in `config/initializers/remote_database_cleaner_home_rails.rb` 

Specify any methods that should be skipped in `RemoteDatabaseCleanerHomeRails::HomeController`. 

```ruby
RemoteDatabaseCleanerHomeRails.configure do |config|
  config.skip_before_filter = [:authenticate, :some_other_method]
  config.strategy = :truncation
end if defined?(RemoteDatabaseCleanerHomeRails)
```

## Run tests


    $ rspec


## Contributing

1. Fork it ( http://github.com/<my-github-username>/remote_database_cleaner_home_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
