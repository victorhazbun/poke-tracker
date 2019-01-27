require 'dry/monads/result'

module TransactionStep

  extend ActiveSupport::Concern
  
  included do
    register 'transaction' do |input, &block|
      result = nil

      begin
        ActiveRecord::Base.transaction do
          result = block.(Dry::Monads.Success(input))
          raise ActiveRecord::Rollback if result.failure?
          result
        end
      rescue ActiveRecord::Rollback
        result
      end
    end
  end
end