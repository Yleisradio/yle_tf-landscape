require 'spec_helper'

require 'yle_tf-landscape/plugin'

describe YleTfPlugins::Landscape::Plugin do
  it 'registers' do
    expect(YleTf::Plugin.manager.registered).to include(described_class)
  end

  it 'adds a `planb` command' do
    expect(YleTf::Plugin.manager.commands).to include('planb')
  end
end
