# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Hello::Index do
  let(:action) { Api::Controllers::Hello::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)

    expect(response[0]).to be 200
  end

  it 'exposes the message' do
    action.call(params)

    expect(action.exposures[:message]).not_to be_nil
  end

  it 'has correct message' do
    action.call(params)

    expect(action.exposures[:message]).to eq('Hello from the backend!')
  end

  it 'exposes the title' do
    action.call(params)

    expect(action.exposures[:title]).not_to be_nil
  end

  it 'has correct title' do
    action.call(params)

    expect(action.exposures[:title]).to eq('Greetings')
  end
end
