class ClientsController < ApplicationController
  before_filter :authenticate_user!
  
  # Implented for CORS - 'Cross-Origin Resource Sharing' for JSON and RAILS #
  respond_to :json, :html
  before_filter :set_headers

  def index  
    @clients = current_user.clients
    authorize @clients
    respond_with @clients
  end

  def new
    @client = current_user.clients.new
    authorize @client
  end

  def create
    @client = current_user.clients.build(client_params)
    authorize @client
    
    if @client.save
      flash[:notice] = "Success!  Client was saved."
      redirect_to @client
    else
      flash[:error] = "There was an error saving the Client. Please try again."
      render :new
    end
  end

  def show
    @client = current_user.clients.find(params[:id])
    @action_plans = @client.action_plans.all
  end

  def edit
    @client = current_user.clients.find(params[:id])
    # authorize @client
  end

  def update
    @client = current_user.clients.find(params[:id])
    # authorize @client
    if @client.update_attributes(client_params)
      flash[:notice] = "Success!  Client was updated."
      redirect_to @client
    else
      flash[:error] = "There was an error saving the client. Please try again."
      render :edit
    end
  end
  
  def destroy
    @client = current_user.clients.find(params[:id])
    first_name = @client.first_name

    if @client.destroy
      flash[:notice] = "\"#{first_name}\" was deleted successfully."
      redirect_to clients_path
    else
      flash[:error] = "There was an error deleting the client."
      render :show
    end
  end


  private
  
  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone, :salesforce_id, :email)
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
