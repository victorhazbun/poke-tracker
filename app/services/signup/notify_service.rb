require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class NotifyService
    include Dry::Transaction::Operation

    def call(params)
      Success(params)
    end
  end
end