class AddReferenceToQuote < ActiveRecord::Migration[6.1]
  def change
    add_reference :quotes, :user, null: false, foreign_key: true
  end
end
