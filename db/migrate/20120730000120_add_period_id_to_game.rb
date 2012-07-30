class AddPeriodIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :period_id, :integer
  end
end
