class AddClientToElevations < ActiveRecord::Migration
  def change
    add_reference :elevations, :client, index: true
  end
end
