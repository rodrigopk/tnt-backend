# frozen_string_literal: true

module Api::Controllers::Users
  class Index
    include Api::Action

    expose :users

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Containers::Users.resolve(:users_index_interactor).new
      end
    end

    def call(_params)
      result = @interactor.call

      @users = result.users
    end
  end
end
