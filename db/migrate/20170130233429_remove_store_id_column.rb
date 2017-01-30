class RemoveStoreIdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column(:brands, :store_id)
  end
end
