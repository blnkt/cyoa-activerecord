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

  describe '.find_by_id' do
    it "find a Adventurer by their ID" do
      adventurer1 = Adventurer.new({name: 'John Steinbeck'})
      adventurer2 = Adventurer.new({name: 'Neil Gaiman'})
      adventurer3 = Adventurer.new({name: 'Neal Stephenson', id: 4})

      expect(Adventurer.find_by_id(0).name).to eq(adventurer1.name)
      expect(Adventurer.find_by_id(1).name).to eq(adventurer2.name)
      expect(Adventurer.find_by_id(2).name).to eq(adventurer3.name)
      expect(Adventurer.find_by_id(4)).to eq(nil)
    end
  end

  describe '#avatar' do
    it 'add an avatar to the adventurers profile' do
      adventurer1 = Adventurer.new({name: 'Neil Gaiman'})
      adventurer3 = Adventurer.new({name: 'Neal Stephenson', id: 4})
      adventurer1.add_avatar('koala')
      adventurer3.add_avatar('%>?<@')
      expect(adventurer1.avatar).to eq("ᶘᵒᴥᵒᶅ")
      expect(adventurer3.avatar).to eq('%>?<@')
    end
  end
end