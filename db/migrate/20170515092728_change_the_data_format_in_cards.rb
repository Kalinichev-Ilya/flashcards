class ChangeTheDataFormatInCards < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :original_text, :string
    change_column :cards, :translated_text, :string
  end
end
