class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :ife
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
