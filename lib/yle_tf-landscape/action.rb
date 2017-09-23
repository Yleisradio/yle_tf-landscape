require 'yle_tf/logger'

module YleTfPlugins
  module Landscape
    module Action
      class ChangeTfCommand
        def initialize(app)
          @app = app
        end

        def call(env)
          YleTf::Logger.debug "Changing 'tf_command' to 'plan'"
          env[:tf_command] = 'plan'

          @app.call(env)
        end
      end
    end
  end
end
