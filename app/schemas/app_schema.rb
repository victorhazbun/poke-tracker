class AppSchema < Dry::Validation::Schema
  configure do |config|
    path = Rails.root.join('config', 'locales', 'schema_errors.yml')
    config.messages_file = path
    config.messages = :i18n
  end
end
