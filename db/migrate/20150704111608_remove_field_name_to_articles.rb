class RemoveFieldNameToArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :prerequisite
        remove_column :articles, :self_study
      end

  def down
    add_column :articles, :self_study, :string
    add_column :articles, :prerequisite, :string
  end
end
