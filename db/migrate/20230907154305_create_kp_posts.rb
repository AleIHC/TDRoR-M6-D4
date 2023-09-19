class CreateKpPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :kp_posts do |t|
      t.references :kp_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
