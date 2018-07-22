# frozen_string_literal: true

require_relative '../../spec_helper'

describe Api::Serializers::User do
  let(:serializer) { described_class.new }

  let(:user) { build_user }
  let(:serialized_user) { build_serialized_user }
  let(:users) { [user] }
  let(:serialized_users) { build_serialized_users }

  describe '#serialize_user' do
    it 'returns the serialized user' do
      expect(serializer.serialize_user(user)).to eq(serialized_user)
    end
  end

  describe '#serialize_users' do
    it 'returns serialized users' do
      expect(serializer.serialize_users(users)).to eq(serialized_users)
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
      user: mapped_user(user),
    }.to_json
  end

  def mapped_user(user)
    {
      id: user.id,
      name: user.name,
      email: user.email,
    }
  end

  def build_serialized_users
    {
      users: [mapped_user(user)],
    }.to_json
  end
end
