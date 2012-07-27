class AddSportIdToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :sport_id, :integer
  end
end
