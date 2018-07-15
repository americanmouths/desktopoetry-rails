class Category < ApplicationRecord
  has_many :poems
  belongs_to :user
  before_validation :make_title_case
  validates :name, :presence => true

  def make_title_case
    self.name = self.name.titlecase
  end
  
  def poem_ids=(ids)
    ids.each do |id|
      poem = Poem.find_by(id: id)
      if !self.poems.include?(poem)
        self.poems << poem
      end
    end
  end
end
