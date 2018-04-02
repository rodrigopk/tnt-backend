# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Views::Hello::Index do
  let(:exposures) { build_exposures }
  let(:view) { described_class.new(nil, exposures) }
  let(:serialized) { exposures.to_json }

  describe '#render' do
    it 'serializes the message' do
      expect(view.render).to eq(serialized)
    end
  end

  private

  def build_exposures
    { title: 'Greetings', message: 'Hello from the backend!' }
  end
end
