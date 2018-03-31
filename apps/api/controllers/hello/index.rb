# frozen_string_literal: true

module Api
  module Controllers
    module Hello
      class Index
        include Api::Action

        expose :message, :title

        def call(_params)
          @message = 'Hello from the backend!'
          @title = 'Greetings'
          self.status = 200
        end
      end
    end
  end
end
