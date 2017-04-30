class UsinesController < ApplicationController
  before_action :set_usine, only: [:show, :edit, :update, :destroy]


  # GET /usines
  # GET /usines.json

  def index
    @usines = Usine.all
  end

  # GET /usines/1
  # GET /usines/1.json
  def show
  end

  # GET /usines/new
  def new
    @usine = Usine.new
  end

  # GET /usines/1/edit
  def edit
  end

  # POST /usines
  # POST /usines.json
  def create
    @usine = Usine.new(usine_params)

    respond_to do |format|
      if @usine.save
        format.html { redirect_to @usine, notice: 'Usine was successfully created.' }
        format.json { render :show, status: :created, location: @usine }
      else
        format.html { render :new }
        format.json { render json: @usine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usines/1
  # PATCH/PUT /usines/1.json
  def update
    respond_to do |format|
      if @usine.update(usine_params)
        format.html { redirect_to @usine, notice: 'Usine was successfully updated.' }
        format.json { render :show, status: :ok, location: @usine }
      else
        format.html { render :edit }
        format.json { render json: @usine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usines/1
  # DELETE /usines/1.json
  def destroy
    @usine.destroy
    respond_to do |format|
      format.html { redirect_to usines_url, notice: 'Usine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usine
      @usine = Usine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usine_params
      params.require(:usine).permit(:name, :address, :zip, :city, :country, :description)
    end
end
