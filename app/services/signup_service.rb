class SignupService
  include Dry::Transaction(container: SignupContainer)

  step :validate, with: 'signup.validate'
  step :persist, with: 'signup.persist'
  step :notify, with: 'signup.notify'
end