require 'spec_helper'

describe Adventure do
#   before do
#     Adventure.clear
#   end
it { should have_and_belong_to_many :chapters }
it {should belong_to :user}
  describe "#initialize" do
    it "initialize an Adventure (i.e. an adventurer's reading/writing of the available chapters" do
       new_adventure = Adventure.new()
       expect(new_adventure).to be_an_instance_of(Adventure)
    end
  end

#   describe 'Adventure.all' do
#     it "show all adventures" do
#       unexpected_adventure = Adventure.new({:name => "blnkt"})
#       expect(Adventure.all).to eq [unexpected_adventure]
#     end
#   end

#   describe "#add_chapter" do
#     it "add a chapter to an adventurer's progress" do
#       four_adventure = Adventure.new({id: Time.now})
#       four_adventure.add_chapter(1)
#       four_adventure.add_chapter(2)
#       four_adventure.add_chapter(3)
#       expect(four_adventure.progress).to eq([1, 2, 3])
#     end

#     it "adds a chapter to an adventurer's progress" do
#       six_adventure = Adventure.new({:name => "William"})
#       six_adventure.add_chapter(1)
#       six_adventure.add_chapter(2)
#       six_adventure.add_chapter(3)
#       six_adventure.add_chapter(2)
#       expect(six_adventure.progress).to eq([1, 2, 3])
#     end
#   end

#   describe '.find_by_id' do
#     it "find a Adventure by its ID" do
#       sad_adventure = Adventure.new({name: 'Grumpy Gus'})
#       happy_adventure = Adventure.new({name: 'Skeeter'})
#       neutral_adventure = Adventure.new({name: 'Daria', id: 4})
#       expect(Adventure.find_by_id(sad_adventure.id)).to eq(sad_adventure)
#       expect(Adventure.find_by_id(happy_adventure.id)).to eq(happy_adventure)
#       expect(Adventure.find_by_id(neutral_adventure.id)).to eq(neutral_adventure)
#     end
#   end
end