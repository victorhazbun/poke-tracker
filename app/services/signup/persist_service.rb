require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class PersistService
    include Dry::Transaction::Operation

    def call(params)
      Success(params)
    end
  end
end
