# frozen_string_literal: true

require 'spec_helper'

describe Containers::Password do
  let(:container) { described_class }

  it 'registers the password service' do
    service = container.resolve(:password_service)
    expect(service).to eq(BCrypt::Password)
  end
end
