require "simple_token/version"
require "simple_token/rails"

module SimpleToken
  def self.included( base )
    base.extend Rails
  end
end

ActiveRecord::Base.send( :include, SimpleToken ) if defined?( ActiveRecord::Base ) and defined?( ActiveSupport::Concern )
