class User < ActiveRecord::Base
  has_simple_token :token_field => :secret_hash, :digest_type => :secure_random
end
