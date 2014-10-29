class ActionPlansController < ApplicationController
  def new
    @client = current_user.clients.find(params[:client_id])
    @action_plan = @client.action_plans.build
  end
  
  def create
    @client = current_user.clients.find(params[:client_id])
    @action_plan = @client.action_plans.build(action_plan_params)
    if @action_plan.save
      flash[:notice] = "Success!  Plan was saved."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the plan. Please try again."
      render :new
    end
  end

  def show
    # @client = current_user.clients.find(params[:client_id])
    @action_plan = ActionPlan.find(params[:id])
  end
  
  def edit
    # @client = current_user.clients.find(params[:client_id])
    @action_plan = ActionPlan.find(params[:id])
  end
  
  def update
    @action_plan = ActionPlan.find(params[:id])
    # authorize @client
    if @action_plan.update_attributes(action_plan_params)
      flash[:notice] = "Success!  Plan was updated."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the plan. Please try again."
      render :edit
    end
  end


  private
  
  def action_plan_params
    params.require(:action_plan).permit(:description)
  end
end
