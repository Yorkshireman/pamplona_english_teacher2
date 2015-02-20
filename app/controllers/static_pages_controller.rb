class StaticPagesController < ApplicationController
  def home
  	@testimonials = Testimonial.all
  end
end
