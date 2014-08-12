require 'spec_helper'

describe "#initialize" do
  it "intializes chapter with an episode" do
    new_chapter = Chapter.new({:episode => "When you're here you're family"})
  	expect(new_chapter).to be_an_instance_of Chapter
	end
end