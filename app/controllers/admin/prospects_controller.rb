class Admin::ProspectsController < AdminController
  def index
    @prospects = Prospect.all
  end

  def edit
    @prospect = Prospect.find(params[:id])
  end

  def update
    @prospect = Prospect.find(params[:id])
    if @prospect.update_attributes(prospect_params)
      redirect_to admin_prospect_path(@prospect)
    else
      render :edit
    end
  end

  def create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save
      redirect_to admin_prospects_path
    else
      render :new
    end
  end

  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy
    redirect_to admin_prospects_path, :notice => "Deleted"
  end

  def new
    @prospect = Prospect.new
  end

  def show
    @prospect = Prospect.find(params[:id])
  end

  private
  def prospect_params
    params.require(:prospect).permit(:name, :email, :phone, :reason, :street, :citystatezip)
  end
end
