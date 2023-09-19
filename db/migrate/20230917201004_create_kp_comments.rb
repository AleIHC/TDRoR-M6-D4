class CreateKpComments < ActiveRecord::Migration[7.0]
  def change
    create_table :kp_comments do |t|
      t.text :content
      t.references :kp_user, null: false, foreign_key: true
      t.references :kp_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
