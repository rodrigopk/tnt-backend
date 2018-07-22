# frozen_string_literal: true

module Containers
  module Users
    extend Dry::Container::Mixin

    register :user_repository do
      UserRepository
    end
  end
end
