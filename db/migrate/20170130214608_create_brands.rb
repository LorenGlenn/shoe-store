class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands) do |b|
      b.column(:name, :string)
      b.column(:description, :string)

      b.timestamps()
    end
  end
end
