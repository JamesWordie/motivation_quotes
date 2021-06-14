class CreateUserQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_quotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
