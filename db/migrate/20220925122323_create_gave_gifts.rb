class CreateGaveGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gave_gifts do |t|

      t.references :user,          null: false, foreign_key: true
      t.date       :g_date,        null: false
      t.string     :g_content,     null: false
      t.string     :g_person,      null: false
      t.string     :g_shop,        null: false
      t.string     :g_situation,   null: false
      t.text       :g_memo
      t.integer    :recommend_id,  null: false

      t.timestamps
    end
  end
end
