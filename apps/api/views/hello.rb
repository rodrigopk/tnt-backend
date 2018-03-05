# frozen_string_literal: true

module Api
  module Views
    class Hello
      include Api::View

      def render
        response = { message: hello }
        raw response.to_json
      end
    end
  end
end
