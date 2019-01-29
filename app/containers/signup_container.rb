class SignupContainer
  extend Dry::Container::Mixin

  namespace 'signup' do
    register 'validate' do
      Signup::ValidateOperation.new
    end

    register 'persist' do
      Signup::PersistOperation.new
    end

    register 'notify' do
      Signup::NotifyOperation.new
    end
  end
end
