class Foreignkey < ActiveRecord::Migration
  def change
     add_foreign_key :pictures, :users
  end
end
