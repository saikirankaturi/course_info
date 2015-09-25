class RemoveFieldNameFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :org_content
        remove_column :posts, :string
        remove_column :posts, :mod_content
        remove_column :posts, :string
      end

  def down
    add_column :posts, :string, :string
    add_column :posts, :mod_content, :string
    add_column :posts, :string, :string
    add_column :posts, :org_content, :string
  end
end
