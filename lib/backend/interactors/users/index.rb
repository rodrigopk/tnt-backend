# frozen_string_literal: true

require 'hanami/interactor'

module Interactors
  module Users
    class Index
      include Hanami::Interactor

      expose :users

      def initialize(dependencies = {})
        @user_repository = dependencies.fetch(:repository) do
          UserRepository.new
        end
      end

      def call
        @users = @user_repository.all
      end
    end
  end
end
