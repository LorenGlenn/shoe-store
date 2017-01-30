class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    add_column(:brands, :store_id, :integer)
  end
end
