# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Interactors::Users::Signup do
  let(:repository) { instance_double(UserRepository) }
  let(:interactor) { described_class.new(repository: repository) }

  let(:user_params) { build_user_params }
  let(:user) { instance_double(User) }

  describe '#call' do
    it 'creates an user' do
      expect(repository).to receive(:create).with(user_params).and_return(user)

      interactor.call(user_params)
    end

    it 'exposes the created user' do
      allow(repository).to receive(:create).with(user_params).and_return(user)

      result = interactor.call(user_params)
      expect(result.user).to eq(user)
    end
  end

  private

  def build_user_params
    {
      name: 'Penelope Cruz',
      email: 'penelope@cruz.com',
      password: 'p4sswrD',
    }
  end
end
