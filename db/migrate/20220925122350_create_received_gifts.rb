class CreateReceivedGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :received_gifts do |t|

      t.references :user,          null: false, foreign_key: true
      t.date       :r_date,        null: false
      t.string     :r_content,     null: false
      t.string     :r_person,      null: false
      t.string     :r_situation,   null: false
      t.text       :r_memo
      t.integer    :received_id,  null: false

      t.timestamps
    end
  end
end
