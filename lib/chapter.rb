
class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  has_many :choices, class_name: 'Chapter', foreign_key: 'parent_chapter_id'
  belongs_to :parent_chapter, class_name: 'Chapter'
  @@chapters = []

  def add_episode episode
    self.update(episode: episode.to_s)
  end

  def add_choice prompt
    choice = Chapter.create(prompt: prompt, episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", parent_chapter_id: self.id)
    self.choices << Chapter.create
    choice.update(parent_chapter_id: self.id)
  #   if @@chapt ers.length == 1
  #     @id = 0
  #     Chapter.new({episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", prompt: choice, parent_chapter: @id, id: (@id + 1), adventure_id: adventure_id})
  #     @choices << @id + 1
  #   else
  #     next_id = @@chapters.length
  #     Chapter.new({episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", prompt: choice, parent_chapter: @id, id: next_id, adventure_id: adventure_id})
  #     @choices << next_id
  #   end
  end
end