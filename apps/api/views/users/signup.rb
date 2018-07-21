# frozen_string_literal: true

module Api::Views::Users
  class Signup
    include Api::View

    def render
      raw Api::Serializers::User.new.call(user)
    end
  end
end
