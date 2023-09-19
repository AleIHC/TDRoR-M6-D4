class AddImageLegendToKpPost < ActiveRecord::Migration[7.0]
  def change
    add_column :kp_posts, :image_legend, :string
  end
end
