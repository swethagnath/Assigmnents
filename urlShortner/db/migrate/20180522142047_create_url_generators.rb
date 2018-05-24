class CreateUrlGenerators < ActiveRecord::Migration[5.1]
  def change
    create_table :url_generators do |t|
      t.integer :user_id
      t.string :url
      t.string :encoded_url

      t.timestamps
    end
  end
end
