class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.references :admin, index: true #il s'agit de la même commande que t.belongs_to :user, index: true. Normalement on mets la ligne de code : t.references :user, foreign_key: true, index: true. Mais ici, on a pas encore déterminer la FK admin_id donc on le fera dans le model. Voir model Event : belongs_to :admin...
      t.timestamps
    end
  end
end
