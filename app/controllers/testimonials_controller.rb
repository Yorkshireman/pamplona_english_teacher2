class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @testimonials = Testimonial.all
  end

  def show
  end

  def new
    @testimonial = Testimonial.new
  end

  def edit
  end

  def create
    @testimonial = current_user.testimonials.build(testimonial_params)
    if @testimonial.save
      redirect_to root_url, notice:'Testimonial created! Thankyou!'
    else
      render 'static_pages/home'
    end
  end

  def update
    if @testimonial.update(testimonial_params)
      redirect_to @testimonial, notice: 'Testimonial was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @testimonial.destroy
    redirect_to root_url, notice: 'Testimonial was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def correct_user
      if @testimonial.user != current_user
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testimonial_params
      params.require(:testimonial).permit(:content)
    end
end
