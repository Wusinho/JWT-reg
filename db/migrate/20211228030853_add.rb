class Add < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :user, foreign_key: true, null: false
  end
end
