class TextMessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:receive]
  protect_from_forgery :except => ["receive"]
  
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
  @text_message.sentstatus = false
  @text_message.phone = phone
  
  if @text_message.scheduled_date == nil 
    @text_message.send_text_message(@text_message.content, @text_message.phone)
  end

  if (@text_message.save && (@text_message.sentstatus == true))
    flash[:notice] = "Success! Text message is being sent now."
    redirect_to @text_message.step.goal.action_plan 
  elsif (@text_message.save && (@text_message.sentstatus == false))
    flash[:notice] = "Success! Text message was scheduled."
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

def receive
  @text_message=TextMessage.create!(content: params[:Body], phone: params[:From])
  @text_message.incoming_message = true
end  

private

def text_message_params
  params.require(:text_message).permit(:content, :scheduled_date, :client_id, :sentstatus, :phone)
end  

end
