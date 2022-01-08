class AddServiceToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :service, :string
  end
end
