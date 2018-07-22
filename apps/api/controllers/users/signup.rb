# frozen_string_literal: true

module Api::Controllers::Users
  class Signup
    include Api::Action

    expose :user

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    params do
      required(:user).schema do
        required(:email).filled(:str?, format?: VALID_EMAIL_REGEX)
        required(:name).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Containers::Users.resolve(:users_signup_interactor).new
      end
    end

    def call(params)
      halt 422 unless params.valid?

      @user = @interactor.call(params[:user]).user
    rescue Interactors::Users::Signup::EmailAlreadyTakenError
      halt 409
    end
  end
end
