class TextsController < ApplicationController
  
  def new
    @client = current_user.clients.find(params[:client_id])
    @text_message = @client.text_message.build
  end

  def create
    @client = Client.find(params[:text_message][:client_id])
    content = params[:text_message][:content]
    message_sent = Twilio.send_message(@client.phone, content)
    
    if message_sent
      text_message = TextMessage.new(text_message_params)
      text_message.incoming_message = false
      if text_message.save
        flash[:notice] = "Success! Text Message was saved."
        redirect_to @action_plan
      else
        flash[:error] = "There was an error saving the text message. Please try again."
        render :new
      end
    end

  end  

  private

  def text_message_params
    params.require(:text_message).permit(:content, :scheduled_date, :client_id)
  end  

end
