# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Users::Signup do
  let(:interactor) { instance_double(Interactors::Users::Signup) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { build_params }
  let(:user) { instance_double(User) }

  describe '#call' do
    context 'missing required parameters' do
      it 'returns 422 status' do
        response = action.call(Hash[])
        expect(response[0]).to eq 422
      end
    end

    context 'valid parameters' do
      it 'creates a new user' do
        expect(interactor).to create_new_user

        action.call(params)
      end

      it 'is successful' do
        allow(interactor).to create_new_user

        response = action.call(params)
        expect(response[0]).to eq 200
      end

      it 'exposes the new user' do
        allow(interactor).to create_new_user

        action.call(params)
        expect(action.exposures[:user]).to eq(user)
      end

      context 'email already taken' do
        it 'returns 409' do
          allow(interactor).to raise_email_already_taken_error

          response = action.call(params)
          expect(response[0]).to eq 409
        end
      end
    end
  end

  private

  def create_new_user
    receive(:call)
      .with(params[:user])
      .and_return(Hanami::Interactor::Result.new(user: user))
  end

  def raise_email_already_taken_error
    receive(:call)
      .with(params[:user])
      .and_raise(Interactors::Users::Signup::EmailAlreadyTakenError)
  end

  def build_params
    {
      user: {
        email: 'penelope@cruz.com',
        name: 'Penelope Cruz',
        password: 'SuperStrongP4ssw0rd',
      },
    }
  end
end
