class DropTestimonialsTable < ActiveRecord::Migration
  def change
  	drop_table :testimonials
  end
end
