# frozen_string_literal: true

module Api
  module Views
    module Hello
      class Index
        include Api::View

        def render
          response = { title: title, message: message }
          raw response.to_json
        end
      end
    end
  end
end
