class AddRankToSport < ActiveRecord::Migration
  def change
    add_column :sports, :rank, :integer
  end
end
