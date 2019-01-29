require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class PersistOperation
    include Dry::Transaction::Operation

    def call(params)
      Success(params)
    end
  end
end
