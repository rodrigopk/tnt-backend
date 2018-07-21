# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Views::Users::Signup do
  let(:user) { build_user }
  let(:exposures) { Hash[user: user] }

  let(:view)      { Api::Views::Users::Signup.new(nil, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    expect(rendered).to eq(serialized_response)
  end

  private

  def build_user
    object_double(
      User.new,
      id: 'some-user-id',
      email: 'penelope@cruz.com',
      name: 'Penelope Cruz',
    )
  end

  def serialized_response
    Api::Serializers::User.new.call(user)
  end
end
