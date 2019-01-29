require 'dry/transaction'
require 'dry/transaction/operation'

module JwtDecode
  class ValidateService
    include Dry::Transaction::Operation

    Dry::Validation.load_extensions(:monads)

    def call(params)
      schema.call(params.slice(:token)).to_monad
    end

    private

    def schema
      Dry::Validation.Schema(AppSchema) do
        configure { config.namespace = :signup }

        required(:token).filled
      end
    end
  end
end
