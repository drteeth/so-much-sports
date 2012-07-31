class RenameTypeToGameType < ActiveRecord::Migration
  def change
    remove_column :games, :type, :string
    add_column :games, :game_type, :string
  end
end
