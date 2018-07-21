# frozen_string_literal: true

module Api
  module Serializers
    class User
      def serialize_user(user)
        serialize(user: map_user(user))
      end

      private

      def serialize(data)
        JSON.generate(data)
      end

      def map_user(user)
        {
          id: user.id,
          name: user.name,
          email: user.email,
        }
      end
    end
  end
end
