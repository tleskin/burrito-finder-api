class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :url
    end
  end
end
