require 'spec_helper'

describe 'Adventure' do

  describe "#initialize" do
    it "initialize an Adventure (i.e. an adventurer's reading/writing of the available chapters" do
      new_adventure = Adventure.new({:name => "blnkt"})
      expect(new_adventure).to be_an_instance_of(Adventure)
    end
  end
end