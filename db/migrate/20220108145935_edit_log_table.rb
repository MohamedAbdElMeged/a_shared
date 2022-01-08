class EditLogTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :logs , :service , :domain
    add_column :logs, :domain_id, :integer
  end
end
