# frozen_string_literal: true

module Api::Views::Users
  class Signup
    include Api::View

    def render
      raw Api::Serializers::User.new.serialize_user(user)
    end
  end
end
