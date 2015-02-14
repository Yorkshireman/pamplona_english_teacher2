class AddUserIdToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :user_id, :integer
    add_index :testimonials, :user_id
  end
end
