class SignupForm
  include Dry::Transaction(container: SignupContainer)

  around :transaction, with: 'transaction'
  step :validate, with: 'signup.validate'
  step :persist, with: 'signup.persist'
  step :notify, with: 'signup.notify'
end