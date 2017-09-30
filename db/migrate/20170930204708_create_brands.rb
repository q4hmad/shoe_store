class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:brand, :string)
      t.column(:store_id, :integer)
    end
  end
end
