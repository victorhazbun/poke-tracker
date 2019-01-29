class SignupController < ApplicationController

  def create
    signup_service = SignupService.new
    signup_service.call(record: User, params: {}) do |m|
      m.success do |user|
        puts "success #{user}"
        # render json: user.to_json, status: :ok
      end

      m.failure :validate do |validation|
        puts "failure validate #{validation}"
        # render json: validation.errors, status: :unprocessable_entity
      end

      m.failure do |error|
        puts "failure #{error}"
        # render json: error.message, status: :internal_server_error
      end
    end
  end
end