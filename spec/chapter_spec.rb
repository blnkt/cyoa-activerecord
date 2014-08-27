require 'spec_helper'
describe Chapter do

	it { should have_and_belong_to_many :adventures}
	it { should have_many :choices }
	it { should belong_to  :parent_chapter }

	# describe '#add_episode' do
	#   it "add an episode text to a chapter" do
	#   	unexpected_astronaut = Chapter.new({:name => "Unexpected Astronaut"})
	#   	unexpected_astronaut.add_episode("No one ever expects the unexpected astronaut")
	#   	expect(unexpected_astronaut.episode).to eq("No one ever expects the unexpected astronaut")
	#   end
	# end

	# describe '#add_choice' do
	#   it "add a choice to a chapter" do
	#     beatles_chapter = Chapter.new({:episode => "they came in through the bathroom window", :id => 0})
	#     beatles_chapter.add_choice("walk away", 2)
	#     beatles_chapter.add_choice("fight!", 1)
	#     expect(beatles_chapter.choices[1]).to eq(2)
	#     # expect(beatles_chapter.choices[1]
	#   end
	# end

end