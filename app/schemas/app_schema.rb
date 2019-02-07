class AppSchema < Dry::Validation::Schema
  configure do |config|
    path = Rails.root.join('config', 'locales', 'validation_errors.yml')
    config.messages_file = path
    config.messages = :i18n

    def unique?(attr_name, value)
      record.class.where.not(id: record.id).where(attr_name => value).empty?
    end
  end
end
