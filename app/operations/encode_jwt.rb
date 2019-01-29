class EncodeJwt
  include Dry::Transaction(container: JwtContainer)

  step :validate, with: 'jwt_encode.validate'
  step :execute, with: 'jwt_encode.execute'
end
