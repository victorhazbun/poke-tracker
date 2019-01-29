require 'jwt'
require 'dry/transaction'
require 'dry/transaction/operation'
require 'dry/monads/try'
require 'dry/monads/result'


module JwtDecode
  class ExecuteService
    include Dry::Transaction::Operation
    include Dry::Monads::Try::Mixin

    def call(params)
      res = Try(JWT::DecodeError) do 
        JWT.decode(params[:token], Rails.application.credentials.secret_key_base).first
      end
      res.to_result
    end
  end
end
