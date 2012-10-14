class AddPeriodIdToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :period_id, :string
  end
end
