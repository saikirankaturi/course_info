class AddFieldNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :name, :string

    add_column :posts, :email, :string

    add_column :posts, :prof_student, :string

  end
end
