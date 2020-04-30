class EditUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :goal_id, :integer
    add_column :users, :comment_id, :integer
  end
end
