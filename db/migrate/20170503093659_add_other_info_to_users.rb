class AddOtherInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :contact_no, :string
    add_column :users, :account_no, :string
    add_column :users, :bank, :string
    add_column :users, :base_salary, :int
    add_column :users, :no_of_dependents, :int
  end
end
