class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :saved_title
      t.string :text
      t.string :url
    end
  end
end
