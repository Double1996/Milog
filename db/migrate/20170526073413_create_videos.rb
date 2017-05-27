class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :video,     null: false
      t.boolean :posted,  default: false
      t.timestamps
    end
  end
end