# frozen_string_literal: true

module Containers
  module Password
    extend Dry::Container::Mixin

    register :password_service do
      BCrypt::Password
    end
  end
end
