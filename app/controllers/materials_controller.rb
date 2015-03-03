class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]
  before_action :admin?, only: [:new]

  def index
    @materials = Material.all
  end

  def show
  end

  def new
    @material = current_user.materials.build
  end

  def edit
  end

  def create
    @material = current_user.materials.build(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    def correct_user
      if @material.user !=current_user
        redirect_to materials_path, notice: "You can't mess with other people's materials, naughty!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:title, :level, :description, :link)
    end
end
