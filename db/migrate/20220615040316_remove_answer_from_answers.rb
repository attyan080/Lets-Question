class RemoveAnswerFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :answer, :text
  end
end
