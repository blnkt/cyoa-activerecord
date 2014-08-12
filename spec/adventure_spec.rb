require 'spec_helper'

describe 'Adventure' do
  before do
    Adventure.clear
  end
  describe "#initialize" do
    it "initialize an Adventure (i.e. an adventurer's reading/writing of the available chapters" do
      new_adventure = Adventure.new({:name => "blnkt"})
      expect(new_adventure).to be_an_instance_of(Adventure)
    end
  end

  describe '.all' do
    it "show all adventures" do
      unexpected_adventure = Adventure.new({:name => "blnkt"})
      expect(Adventure.all).to eq [unexpected_adventure]
    end
  end

  describe "#add_chapter" do
    it "add a chapter to an adventurer's progress" do
      four_adventure = Adventure.new({:name => "Bill"})
      four_adventure.add_chapter(1)
      four_adventure.add_chapter(2)
      four_adventure.add_chapter(3)
      expect(four_adventure.progress).to eq([1, 2, 3])
    end

    it "adds a chapter to an adventurer's progress" do
      six_adventure = Adventure.new({:name => "William"})
      six_adventure.add_chapter(1)
      six_adventure.add_chapter(2)
      six_adventure.add_chapter(3)
      six_adventure.add_chapter(2)
      expect(six_adventure.progress).to eq([1, 2, 3])
    end
  end
end