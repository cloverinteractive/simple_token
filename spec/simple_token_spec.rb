require 'spec_helper'

module SimpleToken
  describe Rails do
    context 'Default settings' do
      let( :post ) { Post.new }

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
    end
  end
end
