require 'dry-validation'

class SignupValidator
  Dry::Validation.load_extensions(:monads)

  SignupSchema = Dry::Validation.Schema(AppSchema) do
    configure do
      option :record

      configure { config.namespace = :signup }

      config.input_processor = :sanitizer
    end

    required(:signup).schema do
      required(:password).filled(:str?, min_size?: 12).confirmation
      required(:email).filled(:str?, unique?: :email)
    end
  end
end