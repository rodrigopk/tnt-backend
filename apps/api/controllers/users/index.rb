# frozen_string_literal: true

module Api::Controllers::Users
  class Index
    include Api::Action

    expose :users

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Users::Index.new
      end
    end

    def call(_params)
      result = @interactor.call

      @users = result.users
    end
  end
end
