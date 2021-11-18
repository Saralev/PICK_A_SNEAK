class AddAddressToSneakers < ActiveRecord::Migration[6.0]
  def change
    add_column :sneakers, :address, :string
  end
end
