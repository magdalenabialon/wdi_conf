class AddDescriptionToSpeech < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :description, :string
  end
end
