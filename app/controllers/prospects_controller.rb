class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:update]

  def new
    session[:address] = params[:search][:address]
    session[:citystatezip] = params[:search][:citystatezip]
    @prospect = Prospect.new
    @prospect.street = session[:address]
    @prospect.citystatezip = session[:citystatezip]
    @prospect.save(validate: false)

    geocode = Geocoder.search(@prospect.address)
    @hash = Gmaps4rails.build_markers(geocode) do |prospect, marker|
      marker.lat prospect.latitude
      marker.lng prospect.longitude
    end
  end

  def update

    respond_to do |format|
      if @prospect.update_attributes(prospect_params)
        # Generates and sends email to specified prospect email
        ProspectMailer.welcome_email(@prospect).deliver

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
