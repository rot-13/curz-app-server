class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title
      t.string :url

      t.index :title, unique: true
    end
  end
end
