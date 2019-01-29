require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class ValidateOperation
    include Dry::Transaction::Operation

    def call(record:, params:)
      SignupValidator::SignupSchema.with(record: User).call(params).to_monad
    end
  end
end
