class AddImpressionsCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :impressions_count, :integer
  end
end
