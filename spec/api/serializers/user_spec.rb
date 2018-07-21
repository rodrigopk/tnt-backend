# frozen_string_literal: true

require_relative '../../spec_helper'

describe Api::Serializers::User do
  let(:serializer) { described_class.new }

  let(:user) { build_user }
  let(:serialized_user) { build_serialized_user }

  describe '#call' do
    it 'returns the serialized user' do
      expect(serializer.call(user)).to eq(serialized_user)
    end
  end

  private

  def build_user
    object_double(
      User.new,
      id: 'some-user-id',
      name: 'Penelope Cruz',
      email: 'penelope@cruz.com',
      password_digest: 'encrypted-password',
    )
  end

  def build_serialized_user
    {
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
      },
    }.to_json
  end
end
