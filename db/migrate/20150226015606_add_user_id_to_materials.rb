class AddUserIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :user_id, :integer
    add_index :materials, :user_id
  end
end
