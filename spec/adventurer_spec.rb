require 'spec_helper'

describe 'Adventurer' do
  before do
    Adventurer.clear
  end
  describe "#initialize" do
    it "initialize an Adventurer with a name, bio, id, fave book, or avatar" do
      new_adventurer = Adventurer.new({:name => "blnkt"})
      expect(new_adventurer).to be_an_instance_of(Adventurer)
    end
  end
end