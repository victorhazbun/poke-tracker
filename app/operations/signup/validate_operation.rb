require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class ValidateOperation
    include Dry::Transaction::Operation

    def call(record:, attributes:)
      SignupValidator::SignupSchema.with(record: record).call(attributes).to_monad
    end
  end
end
