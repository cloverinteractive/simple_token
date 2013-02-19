require 'bundler/setup'
require 'rspec'
require 'factory_girl'
require 'active_record'
require 'active_support'
require 'simple_token'
require 'sqlite3'
require 'factories'

SPEC_PATH = File.expand_path File.join( File.dirname __FILE__ )
config    = YAML::load( IO.read( File.join SPEC_PATH, 'config', 'database.yml' ) )['test']['sqlite']

# Connect to sqlite3 and load models
ActiveRecord::Base.establish_connection config
ActiveSupport::Dependencies.autoload_paths.unshift File.join( SPEC_PATH, 'app', 'models' )

# Load schema.rb into sqlite3
ActiveRecord::Base.silence do
  ActiveRecord::Migration.verbose = false
  load File.join( SPEC_PATH, 'db', 'schema.rb' )
end

RSpec.configure do |config|
  config.order = 'random'
  config.include FactoryGirl::Syntax::Methods
end
