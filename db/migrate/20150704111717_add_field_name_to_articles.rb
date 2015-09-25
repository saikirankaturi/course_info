class AddFieldNameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :org_prerequisite, :string

    add_column :articles, :org_self_study, :string

    add_column :articles, :mod_prerequisite, :string

    add_column :articles, :mod_self_study, :string

  end
end
