class AddDescriptionToSneakers < ActiveRecord::Migration[6.0]
  def change
    add_column :sneakers, :description, :string
  end
end
