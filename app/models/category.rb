class Category < ApplicationRecord
  has_many :poems
  belongs_to :user
  validates :name, :presence => true

  def poem_ids=(ids)
    ids.each do |id|
      poem = Poem.find_by(id: id)
      if !self.poems.include?(poem)
        self.poems << poem
      end
    end
  end
end
