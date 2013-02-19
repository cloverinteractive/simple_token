require 'spec_helper'

module SimpleToken
  describe Rails do
    context 'Default settings' do
      let( :post ) { build :post }

      it 'should respond to token' do
        post.should respond_to( :token )
      end

      it 'should generate an unique 64 chars long SHA2 digest' do
        token = post.token

        token.should_not be_blank
        token.length.should eql( 64 )
      end

      it 'should generate token before being persisted' do
        post.token.should_not be_blank
        post.should_not be_persisted
      end

      it 'should generate new tokens each time' do
        persisted_post = create :post
        persisted_post.token.should_not eql( post.token )
      end

      it 'should have a create_sha2_token private method' do
        post.private_methods.should be_include( :create_sha2_token )
      end

      it 'should have a create_secure_random_token private method' do
        post.private_methods.should be_include( :create_secure_random_token )
      end

      it 'should have a token_lookup private method' do
        post.private_methods.should be_include( :token_lookup )
      end

      context :create_secure_random_token do
        it 'should generate a 64 chars string' do
          secure_random = post.send( :create_secure_random_token )
          secure_random.should_not be_blank
          secure_random.length.should eql( 64 )
        end
      end

      context :create_sha2_token do
        it 'should generate a 64 chars string' do
          sha2 = post.send( :create_sha2_token )
          sha2.should_not be_blank
          sha2.length.should eql( 64 )
        end
      end

      context :token_lookup do
        it 'works by receiving a block of code to generate a string and returning such string if unique' do
          lookup = post.send( :token_lookup ) do
            'foo'
          end

          lookup.should eql( 'foo' )
        end
      end
    end

    context 'Custom settings' do
      let( :user ) { build :user }

      it 'should have a getter named secret_hash' do
        user.should respond_to( :secret_hash )
      end

      it 'should have a 64 chars secret_hash' do
        user.secret_hash.length.should eql( 64 )
      end

      it 'should generate a new token in secret_hash even if not persisted' do
        user.secret_hash.should be_present
        user.should_not be_persisted
      end

      it 'should generate a unique token each time' do
        persisted_user = create :user
        persisted_user.secret_hash.should_not eql( user.secret_hash )
      end
    end
  end
end
