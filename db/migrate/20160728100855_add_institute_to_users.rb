class AddInstituteToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :institute, index: true, foreign_key: true
  end
end
