require 'terraform_landscape'
require 'yle_tf/logger'
require 'yle_tf/system'

module YleTfPlugins
  module Landscape
    class Command
      def execute(env)
        args = env[:tf_command_args].dup
        args << '-no-color'
        args << '-input=false'

        landscape_handler = landscape_handler(env)

        YleTf::Logger.info 'Running `terraform plan`'
        YleTf::System.cmd('terraform', 'plan', *args,
                          stdin: :console,
                          stdout: landscape_handler)
      end

      def landscape_handler(env)
        printer = landscape_printer(env)

        proc do |io|
          YleTf::Logger.debug 'Streaming to Landscape'
          Thread.new { printer.process_stream(io) }
        end
      end

      def landscape_printer(env)
        output = landscape_output(env)
        TerraformLandscape::Printer.new(output)
      end

      def landscape_output(env)
        TerraformLandscape::Output.new(STDOUT).tap do |output|
          output.color_enabled = false if env[:tf_options][:no_color]
        end
      end
    end
  end
end
