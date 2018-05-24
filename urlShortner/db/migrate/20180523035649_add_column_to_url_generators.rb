class AddColumnToUrlGenerators < ActiveRecord::Migration[5.1]
  def change
  	add_column :url_generators,:modified_url,:string
  end
end
