class RemoveFieldNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :prof_student
      end

  def down
    add_column :users, :prof_student, :integer
  end
end
