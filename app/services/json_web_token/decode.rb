module JsonWebToken
  class Decode
    include Dry::Transaction(container: JsonWebTokenContainer)

    step :decode, with: 'json_web_token.decode'
  end
end