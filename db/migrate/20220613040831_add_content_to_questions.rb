class AddContentToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :content, :text
    add_column :questions, :title, :string
  end
end
