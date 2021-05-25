class CreateClientDocuments < ActiveRecord::Migration
  def change
    create_table :client_documents do |t|
      t.references :client
      t.references :stage
      t.string :file

      t.timestamps null: false
    end
  end
end
