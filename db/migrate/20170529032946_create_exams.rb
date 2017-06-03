class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string 'title', null:false
      t.string 'description', null:false
      t.timestamps
    end
  end
end
