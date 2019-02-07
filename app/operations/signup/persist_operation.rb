require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class PersistOperation
    include Dry::Transaction::Operation

    def call(attributes, options={})
      user = options[:user]
      user.attributes = attributes[:signup]
      user.save!
      user
    end
  end
end
