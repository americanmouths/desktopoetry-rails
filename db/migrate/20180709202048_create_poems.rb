class CreatePoems < ActiveRecord::Migration[5.1]
  def change
    create_table :poems do |t|
      t.text :content
      t.string :title
      t.date :date
      t.timestamps
    end
  end
end
