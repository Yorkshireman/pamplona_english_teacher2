class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :testimonial

      t.timestamps null: false
    end
  end
end
