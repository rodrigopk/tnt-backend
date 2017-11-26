require_relative '../../../spec_helper'

describe Api::Controllers::::Hello do
  let(:action) { Api::Controllers::::Hello.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
