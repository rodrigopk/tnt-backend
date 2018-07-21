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

        @password_service = dependencies.fetch(:password_service) do
          BCrypt::Password
        end
      end

      def call(params)
        @user = @user_repository.create(
          user_params_with_password_digest(params),
        )
      end

      private

      def user_params_with_password_digest(user_params)
        {
          name: user_params[:name],
          email: user_params[:email],
          password_digest: encrypted_password(user_params[:password]),
        }
      end

      def encrypted_password(password)
        @password_service.create(password)
      end
    end
  end
end
