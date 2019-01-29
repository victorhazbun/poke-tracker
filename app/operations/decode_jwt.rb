class DecodeJwt
  include Dry::Transaction(container: JwtContainer)

  step :validate, with: 'jwt_decode.validate'
  step :execute, with: 'jwt_decode.execute'
end
