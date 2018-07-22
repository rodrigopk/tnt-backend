# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Interactors::Users::Signup do
  let(:repository) { instance_double(UserRepository) }
  let(:password_service) { class_double(BCrypt::Password) }
  let(:interactor) do
    described_class.new(
      repository: repository,
      password_service: password_service,
    )
  end

  let(:user_params) { build_user_params }
  let(:encrypted_password) { 'super-secure-encrypted-password-hash' }
  let(:user) { instance_double(User) }

  it 'injects dependencies' do
    described_class.new
  end

  describe '#call' do
    it 'creates an user' do
      allow(password_service).to encrypt_user_password
      expect(repository).to create_new_user

      interactor.call(user_params)
    end

    it 'encrypts the user password' do
      expect(password_service).to encrypt_user_password
      allow(repository).to create_new_user

      interactor.call(user_params)
    end

    it 'exposes the created user' do
      allow(password_service).to encrypt_user_password
      allow(repository).to create_new_user

      result = interactor.call(user_params)
      expect(result.user).to eq(user)
    end

    context 'email already exists' do
      it 'raises an error' do
        allow(password_service).to encrypt_user_password
        allow(repository).to raise_unique_constraint_violation_error

        expect { interactor.call(user_params) }.to raise_email_taken_error
      end
    end
  end

  private

  def build_user_params
    {
      name: 'Penelope Cruz',
      email: 'penelope@cruz.com',
      password: 'p4sswrD!',
    }
  end

  def create_new_user
    receive(:create)
      .with(user_params_with_password_digest)
      .and_return(user)
  end

  def encrypt_user_password
    receive(:create).and_return(encrypted_password)
  end

  def raise_unique_constraint_violation_error
    receive(:create)
      .with(user_params_with_password_digest)
      .and_raise(Hanami::Model::UniqueConstraintViolationError)
  end

  def raise_email_taken_error
    raise_error(Interactors::Users::Signup::EmailAlreadyTakenError)
  end

  def user_params_with_password_digest
    {
      name: user_params[:name],
      email: user_params[:email],
      password_digest: encrypted_password,
    }
  end
end
