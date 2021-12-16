require_relative '../movement'

describe 'Movement' do

  it "Test to include Hello world" do
    expect(movement('World')).to include('Hello World')
  end

  it "Test not equal Hello world" do
    expect(movement('World')).not_to eq('Hello')
  end
  
end