require "dry/transaction"
require "dry/transaction/operation"

module Signup
  class ValidateService
    include Dry::Transaction::Operation

    def call(params)
      SignupSchema.call(params.slice(:name)).to_monad
    end

    private

    Dry::Validation.load_extensions(:monads)

    SignupSchema = Dry::Validation.Schema(AppSchema) do
      configure { config.namespace = :signup }

      required(:name).filled
    end
  end
end