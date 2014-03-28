require 'spec_helper'

describe 'riemann::riemann' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform_family: 'debian')
    runner.node.set['riemann']['system']['group'] = 'riemann'
    runner.node.set['riemann']['system']['user'] = 'riemann'
    runner.converge(described_recipe)
  end

  %w( runit ark java ).each do |cb|
    it "Should include the #{cb} recipe" do
      expect(chef_run).to include_recipe(cb)
    end
  end

  it 'Should create group riemann' do
    expect(chef_run).to create_group('riemann')
  end

  it 'Should create user riemann' do
    expect(chef_run).to create_user('riemann')
  end

  # it 'Ark Riemman' do
  #   expect(chef_run).to install_ark('riemann')
  # end

  it 'Should Create file from template' do
    expect(chef_run).to create_template
  end
  
end
