# frozen_string_literal: true

describe Interactors::Users::Index do
  let(:repository) { instance_double(UserRepository) }
  let(:interactor) { described_class.new(repository: repository) }

  let(:users) { [instance_double(User)] }

  describe '#call' do
    it 'fetchs all users' do
      expect(repository).to fetch_all_users

      interactor.call
    end

    it 'exposes the retrieved users' do
      allow(repository).to fetch_all_users

      result = interactor.call
      expect(result.users).to eq(users)
    end
  end

  private

  def fetch_all_users
    receive(:all).and_return(users)
  end
end
