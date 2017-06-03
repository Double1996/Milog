class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :exam_id
      t.integer :options
      t.boolean :multi_select
      t.boolean :require
      t.timestamps
    end
    add_index :questions, :exam_id
  end
end
