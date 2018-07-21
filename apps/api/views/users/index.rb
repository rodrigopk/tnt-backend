# frozen_string_literal: true

module Api::Views::Users
  class Index
    include Api::View

    def render
      raw Api::Serializers::User.new.serialize_users(users)
    end
  end
end
