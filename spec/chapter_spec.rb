require 'spec_helper'


describe 'Chapter' do
	before do
		Chapter.clear
	end
	describe "#initialize" do
	  it "intializes chapter with an episode" do
	    new_chapter = Chapter.new({:episode => "When you're here you're family"})
	  	expect(new_chapter).to be_an_instance_of Chapter
		end

		it "initializes with an adventurer's name" do
			new_chapter = Chapter.new({:name => "blnkt"})
			expect(new_chapter).to be_an_instance_of Chapter
		end
	end

	describe '.all' do
	  it "shows all chapters" do
	  	unexpected_astronaut = Chapter.new({episode: "No one ever expects the unexpected astronaut!!"})
	  	expect(Chapter.all).to eq [unexpected_astronaut]
	  end
	end
end