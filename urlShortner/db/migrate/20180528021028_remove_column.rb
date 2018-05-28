class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :url_generators,:user_id
  end
end
