class AppSchema < Dry::Validation::Schema
  configure do |config|
    config.messages_file = Rails.root.join('config/locales/schema_errors.yml')
    config.messages = :i18n
  end
end