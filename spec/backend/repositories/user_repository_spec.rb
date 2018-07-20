# frozen_string_literal: true

require_relative '../../spec_helper'

describe UserRepository do
  let(:repository) { UserRepository.new }

  before do
    repository.clear
  end

  describe '#create' do
    context 'email and name are present' do
      it 'is successfull' do
        user = repository.create(
          email: 'rodrigo@example.com',
          name: 'Rodrigo Vasconcelos',
        )

        expect(user.id).to_not be_nil
      end
    end

    context 'email is not present' do
      it 'it fails' do
        expect do
          repository.create(name: 'Rodrigo Vasconcelos')
        end.to raise_error(Hanami::Model::NotNullConstraintViolationError)
      end
    end

    context 'name is not present' do
      it 'it fails' do
        expect do
          repository.create(email: 'rodrigo@example.com')
        end.to raise_error(Hanami::Model::NotNullConstraintViolationError)
      end
    end

    context 'email already registered' do
      it 'it fails' do
        user = repository.create(
          email: 'rodrigo@example.com',
          name: 'Rodrigo Vasconcelos',
        )

        expect do
          repository.create(
            email: user.email,
            name: 'Rodrigo Vasconcelos Jr.',
          )
        end.to raise_error(Hanami::Model::UniqueConstraintViolationError)
      end
    end
  end
end
