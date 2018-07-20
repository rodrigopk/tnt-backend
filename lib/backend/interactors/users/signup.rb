# frozen_string_literal: true

module Interactors
  module Users
    class Signup
      include Hanami::Interactor

      expose :user

      def initialize(dependencies = {})
        @user_repository = dependencies.fetch(:repository) do
          UserRepository.new
        end
      end

      def call(params)
        @user = @user_repository.create(params)
      end
    end
  end
end
