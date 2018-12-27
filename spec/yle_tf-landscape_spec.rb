# frozen_string_literal: true

require 'spec_helper'

describe YleTfPlugins::Landscape do
  it 'loads' do
    expect { require 'yle_tf-landscape' }.to_not raise_error
  end
end
