class CreateRequisitions < ActiveRecord::Migration[6.1]
  def change
    create_table :requisitions do |t|
      t.string :title
      t.string :department
      t.boolean :full_time
      t.date :preferred_start_date
      t.text :job_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
