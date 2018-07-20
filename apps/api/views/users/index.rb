# frozen_string_literal: true

module Api::Views::Users
  class Index
    include Api::View

    def render
      raw JSON.generate(
        users: users.map do |user|
          {
            id: user.id,
            email: user.email,
            name: user.name,
          }
        end,
      )
    end
  end
end
