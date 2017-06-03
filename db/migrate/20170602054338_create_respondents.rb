class CreateRespondents < ActiveRecord::Migration[5.0]
  def change
    create_table :respondents do |t|
      t.integer 'class_id'
      t.integer 'student_id'
      t.integer 'exam_id'

      t.timestamps
    end
  end
end
