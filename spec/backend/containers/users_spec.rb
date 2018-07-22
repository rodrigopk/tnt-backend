# frozen_string_literal: true

require 'spec_helper'

describe Containers::Users do
  let(:container) { described_class }

  it 'registers the user repository' do
    repository = container.resolve(:user_repository)
    expect(repository).to eq(UserRepository)
  end
end
