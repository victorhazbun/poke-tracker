require 'rails_helper'

describe 'Signup::Creator' do

  subject { Signup::Creator.new }

  context 'failure' do
    describe 'when user schema is invalid' do
      it 'returns the validation error messages' do
        attributes = { signup: attributes_for(:user).merge(password_confirmation: 'BOOM!') }
        failure = subject.call(record: User.new, attributes: attributes).failure

        expect(failure).to eql(signup: { password_confirmation: ['does not match'] })
      end
    end

    describe 'when user raises exception while trying to create' do
      it 'returns the captured exception' do
        attributes = { signup: attributes_for(:user) }
        user_stub = build_stubbed(:user)
        allow(user_stub).to receive(:save!).and_raise(ActiveRecord::RecordInvalid)
        failure = subject
          .with_step_args(persist: [user: user_stub])
          .call(record: user_stub, attributes: attributes).failure

        expect(failure).to be_a(ActiveRecord::RecordInvalid)
      end
    end
  end

  context 'success' do
    describe 'when user is valid' do
      it 'returns the created user' do
        attributes = { signup: attributes_for(:user) }
        user = build(:user)
        success = subject
          .with_step_args(persist: [user: user])
          .call(record: user, attributes: attributes).value!

        expect(success).to be_a(User)
      end

      it 'creates a new user' do
        attributes = { signup: attributes_for(:user) }
        user = build(:user)

        expect{
          subject
          .with_step_args(persist: [user: user])
          .call(record: user, attributes: attributes)
        }.to change { User.count }.by(1)
      end

      it 'sends the signup welcome email' do
        attributes = { signup: attributes_for(:user) }
        user = build(:user)

        expect{
          subject
          .with_step_args(persist: [user: user])
          .call(record: user, attributes: attributes)
        }.to change { User.count }.by(1)
      end
    end
  end
end