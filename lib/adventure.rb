
class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :chapters
  belongs_to :user

  attr_reader :progress, :branches, :id, :user_id

  def add_chapter chapter_id
    if @progress.include?(chapter_id)
      @branches << @progress unless @branches.include?(@progress)
    else
      @progress << chapter_id
    end
  end

  def self.find_by_id id
    self.all.each do |adventure|
     return adventure if id == adventure.id
    end    
  end
end