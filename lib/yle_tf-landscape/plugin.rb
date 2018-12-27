# frozen_string_literal: true

require 'yle_tf'

module YleTfPlugins
  module Landscape
    class Plugin < YleTf::Plugin
      register

      command('planb', 'Run `terraform plan` with landscaped output') do
        require_relative 'action'
        require_relative 'command'

        YleTf::Action::Builder.new do
          use Action::ChangeTfCommand
          use YleTf::Action.default_action_stack(Command)
        end
      end
    end
  end
end
