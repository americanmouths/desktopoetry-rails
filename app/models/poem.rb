class Poem < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, :presence => true
  validates :date, :presence => true
  validates :content, :presence => true

  def category_name=(name)
     self.category = Category.find_or_create_by(name: name)
   end

   def category_name
      self.category ? self.category.name : nil
   end

end
