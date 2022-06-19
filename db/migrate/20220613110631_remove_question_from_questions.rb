class RemoveQuestionFromQuestions < ActiveRecord::Migration[6.1]
  def up
    remove_column :questions, :question
  end

  def down
  end
end
