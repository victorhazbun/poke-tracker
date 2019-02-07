class SignupController < ApplicationController

  def create
    user = User.new
    service = Signup::Creator.new
    service.with_step_args(persist: [user: user]).call(record: user, attributes: params) do |m|
      m.success do |user|
        render json: user.to_json, status: :ok
      end

      m.failure :validate do |validation|
        render json: validation.errors, status: :unprocessable_entity
      end

      m.failure do |exception|
        Bugsnag.notify(exception)
        render json: I18n.t :internal_server_error_message, status: :internal_server_error
      end
    end
  end
end