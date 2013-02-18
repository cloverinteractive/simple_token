module SimpleToken
  module Rails
    def has_simple_token( options={} )
      cattr_accessor :token_field, :digest_type

      return if included_modules.include? InstanceMethods

      self.token_field  = options[:token_field]  || :token
      self.digest_type  = options[:digest_type]  || :sha2

      include InstanceMethods

      define_method( token_field ) do
        return self[ token_field ] unless self[ token_field ].blank?

        new_token = case digest_type
          when :sha2          then create_sha2_token
          when :secure_random then create_secure_random_token
        end

        self[ token_field ] = new_token
      end
    end

    module InstanceMethods
      extend ActiveSupport::Concern

      included do
        private

        def create_sha2_token
          token_lookup do
            salt = rand( 36**12 ).to_s 36
            seed_content = "#{ salt }#{ Time.now.to_i }#{ self.hash }".scan( /./ ).shuffle.join
            new_token = Digest::SHA2.hexdigest seed_content
          end
        end

        def create_secure_random_token
          token_lookup do
            SecureRandom.hex 32
          end
        end

        def token_lookup( &block )
          begin
            new_token = block.call
          end while self.class.exists? token_field => new_token

          new_token
        end
      end
    end
  end
end
