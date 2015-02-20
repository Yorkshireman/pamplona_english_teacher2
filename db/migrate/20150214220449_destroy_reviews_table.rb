class DestroyReviewsTable < ActiveRecord::Migration
  def change
  	drop_table :reviews
  end
end
