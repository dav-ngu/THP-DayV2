class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.references :event, foreign_key: true
      t.references :participant, index: true #il s'agit de la même commande que t.belongs_to :user, index: true. Normalement on mets la ligne de code : t.references :user, foreign_key: true, index: true. Mais ici, on a pas encore déterminer la FK participant_id donc on le fera dans le model. Voir model Event : belongs_to :participant...
      t.timestamps
    end
  end
end
