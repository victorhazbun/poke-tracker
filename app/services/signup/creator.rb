module Signup
  class Creator
    include Dry::Transaction(container: SignupContainer)

    step :validate, with: 'signup.validate'
    try :persist, with: 'signup.persist', catch: ActiveRecord::RecordInvalid
    tee :notify, with: 'signup.notify'
  end
end