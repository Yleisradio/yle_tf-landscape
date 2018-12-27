# frozen_string_literal: true

require 'spec_helper'

require 'yle_tf-landscape/action'

describe YleTfPlugins::Landscape::Action::ChangeTfCommand do
  let(:env) { { tf_command: 'planb' } }
  let(:app) { spy }

  it 'changes the "tf_command" to "plan"' do
    described_class.new(app).call(env)
    expect(env[:tf_command]).to eq('plan')
  end

  it 'calls the next middleware action in the stack' do
    described_class.new(app).call(env)
    expect(app).to have_received(:call)
  end
end
