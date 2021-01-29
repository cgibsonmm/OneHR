class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :client, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.text :about_me
      t.boolean :atw
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
