class AddCustomerIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :customer_id, :integer
    add_column :questions, :genre_id, :integer
  end
end
