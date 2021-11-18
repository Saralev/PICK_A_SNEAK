class AddCoordinatesToSneakers < ActiveRecord::Migration[6.0]
  def change
    add_column :sneakers, :latitude, :float
    add_column :sneakers, :longitude, :float
  end
end
