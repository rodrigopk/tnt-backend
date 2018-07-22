# frozen_string_literal: true

require 'spec_helper'

describe Containers::Users do
  let(:container) { described_class }

  it 'registers the user repository' do
    repository = container.resolve(:user_repository)
    expect(repository).to eq(UserRepository)
  end

  it 'registers the user index interactor' do
    interactor = container.resolve(:users_index_interactor)
    expect(interactor).to eq(Interactors::Users::Index)
  end

  it 'registers the user signup interactor' do
    interactor = container.resolve(:users_signup_interactor)
    expect(interactor).to eq(Interactors::Users::Signup)
  end
end
