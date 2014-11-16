class TextMessagesController < ApplicationController
  before_filter :authenticate_user!
  
def new
  @step = Step.find(params[:step_id])
  @text_message = @step.text_messages.build
end

def create
  @step = Step.find(params[:step_id])
  phone = @step.goal.action_plan.client.phone
  content = params[:text_message][:content]
    
  @text_message = @step.text_messages.build(text_message_params)
  @text_message.incoming_message = false
  
  if @text_message.scheduled_date == nil 
    @text_message.send_text_message(@text_message.content, phone)
    @text_message.sentstatus = true
  else
    @text_message.sentstatus = false
  end

  if @text_message.save
    flash[:notice] = "Success! Text Message was saved."
    redirect_to @text_message.step.goal.action_plan 
  else
    flash[:error] = "There was an error saving the text message. Please try again."
    render :new
    end
end

def update
  if @text_message.update_attributes(text_message_params)
      flash[:notice] = "Success! Text was updated."
      redirect_to @text_message.step.goal.action_plan
    else
      flash[:error] = "There was an error saving the text. Please try again."
      render :edit
  end
end 

private

def text_message_params
  params.require(:text_message).permit(:content, :scheduled_date, :client_id, :sentstatus)
end  

end
