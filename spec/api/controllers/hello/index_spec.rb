# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Hello::Index do
  let(:action) { Api::Controllers::Hello::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to be 200
  end
end
