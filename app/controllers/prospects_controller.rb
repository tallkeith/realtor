class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]

  def new
    session[:address] = params[:search][:address]
    session[:citystatezip] = params[:search][:citystatezip]
    @prospect = Prospect.new
    @prospect.street = session[:address]
    @prospect.citystatezip = session[:citystatezip]

    geocode = Geocoder.search(@prospect.address)
    @hash = Gmaps4rails.build_markers(geocode) do |prospect, marker|
      marker.lat prospect.latitude
      marker.lng prospect.longitude
    end
  end

  def create
    @prospect = Prospect.new(prospect_params)
    @prospect.street = session[:address]
    @prospect.citystatezip = session[:citystatezip]

    respond_to do |format|
      if @prospect.save
   

        format.html { redirect_to search_results_path, notice: 'Prospect was successfully created.' }
        format.json { render :show, status: :created, location: @prospect }
      else
        format.html { render :new }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prospect_params
      params.require(:prospect).permit(:name, :email, :phone, :reason)
    end
end
