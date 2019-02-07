module JsonWebToken
  class Encode
    include Dry::Transaction(container: JsonWebTokenContainer)

    step :encode, with: 'json_web_token.encode'
  end
end