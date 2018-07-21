# frozen_string_literal: true

module Api::Views::Users
  class Signup
    include Api::View

    def render
      raw JSON.generate(
        user: {
          id: user.id,
          email: user.email,
          name: user.name,
        },
      )
    end
  end
end
