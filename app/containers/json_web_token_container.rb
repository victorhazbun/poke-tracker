class JsonWebTokenContainer
  extend Dry::Container::Mixin

  namespace 'json_web_token' do
    register 'decode' do
      JsonWebToken::DecodeOperation.new
    end

    register 'encode' do
      JsonWebToken::EncodeOperation.new
    end
  end
end
