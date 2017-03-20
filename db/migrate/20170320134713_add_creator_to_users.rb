class AddCreatorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :creator, :boolean, default: false
  end
end
