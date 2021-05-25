class AddNameToClientDocuments < ActiveRecord::Migration
  def change
    add_column :client_documents, :name, :string
  end
end
