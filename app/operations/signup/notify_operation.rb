require 'dry/transaction'
require 'dry/transaction/operation'

module Signup
  class NotifyOperation
    include Dry::Transaction::Operation

    def call(user)
      SignupMailer.with(user: user).welcome_email.deliver_later
    end
  end
end
