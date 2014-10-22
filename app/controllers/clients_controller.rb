class ClientsController < ApplicationController
  def index
    @clients = Client.all
    authorize @clients
  end

  def create
    @client = Client.new(params.require(:client).permit(:first_name, :last_name, :salesforce_id, :email, :phone))
    authorize @client
    
    if @client.save
      flash[:notice] = "Client was saved."
      redirect_to @client
    else
      flash[:error] = "There was an error saving the Client. Please try again."
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
    authorize @client
  end

  def edit
    @client = Client.find(params[:id])
    # authorize @client
  end

  def update
     @client = Client.find(params[:id])
     # authorize @client
     if @client.update_attributes(params.require(:client).permit(:first_name, :last_name, :salesforce_id, :email, :phone))
       flash[:notice] = "Client was updated."
       redirect_to @client
     else
       flash[:error] = "There was an error saving the client. Please try again."
       render :edit
     end
  end
end
