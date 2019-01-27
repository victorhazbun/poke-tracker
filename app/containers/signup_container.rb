class SignupContainer
  extend Dry::Container::Mixin

  include TransactionStep

  namespace 'signup' do
    register 'validate' do
      Signup::ValidateService.new
    end

    register 'persist' do
      Signup::PersistService.new
    end

    register 'notify' do
      Signup::NotifyService.new
    end
  end
end
