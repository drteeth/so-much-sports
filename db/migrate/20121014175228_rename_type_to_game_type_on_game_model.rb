class RenameTypeToGameTypeOnGameModel < ActiveRecord::Migration
  def up
    rename_column :games, :type, :game_type
  end

  def down
    rename_column :games, :game_type, :type
  end
end
