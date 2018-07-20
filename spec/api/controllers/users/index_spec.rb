# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Users::Index do
  let(:interactor) { instance_double(Interactors::Users::Index) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { Hash[] }
  let(:users) { [instance_double(User)] }
  let(:interactor_response) { Hanami::Interactor::Result.new(users: users) }

  describe '#call' do
    it 'fetchs the users' do
      expect(interactor).to fetch_all_users

      action.call(params)
    end

    it 'is successful' do
      allow(interactor).to fetch_all_users

      response = action.call(params)
      expect(response[0]).to eq(200)
    end

    it 'is exposes the retrieved users' do
      allow(interactor).to fetch_all_users

      action.call(params)
      
      retrieved_users = action.exposures[:users]
      expect(retrieved_users).to eq(users)
    end
  end

  private

  def fetch_all_users
    receive(:call).and_return(interactor_response)
  end
end
