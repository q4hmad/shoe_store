class RemoveForeignKeysFromStore < ActiveRecord::Migration[5.1]
  def change
    remove_column(:stores, :brand_id, :integer)
  end
end
