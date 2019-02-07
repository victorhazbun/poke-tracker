require 'dry-validation'

class SignupValidator
  MIN_PASSWORD_SIZE = 8.freeze

  Dry::Validation.load_extensions(:monads)

  SignupSchema = Dry::Validation.Schema(AppSchema) do
    configure do
      option :record

      configure { config.namespace = :signup }

      config.input_processor = :sanitizer
    end

    required(:signup).schema do
      required(:password).filled(:str?, min_size?: MIN_PASSWORD_SIZE).confirmation
      required(:email).filled(:str?, unique?: :email)
    end
  end
end