class AddResponsibleToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :responsible, :string
  end
end
