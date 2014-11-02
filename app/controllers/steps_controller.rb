class StepsController < ApplicationController
  def new
    @goal = Goal.find(params[:goal_id])
    @steps = @goal.steps.build
  end

  def create
    @goal = Goal.find(params[:goal_id])
    action_plan_id = @goal.action_plan_id
    @action_plan = ActionPlan.find(action_plan_id)
    
    @step = @goal.steps.build(step_params)
    if @step.save
      flash[:notice] = "Success!  Step was saved."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the step. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
  end


  private
  
  def step_params
    params.require(:step).permit(:description, :due_by, :complete)
  end
end
