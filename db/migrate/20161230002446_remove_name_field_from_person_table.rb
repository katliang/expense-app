class RemoveNameFieldFromPersonTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :name
  end
end
