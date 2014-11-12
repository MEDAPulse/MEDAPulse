class TextMessagesController < ApplicationController
  
  def new
    @client = current_user.clients.find(params[:client_id])
    @text_message = @client.text_messages.build
  end

  def create
    @client = current_user.clients.find(params[:client_id])
    content = params[:text_message][:content]
    
    @text_message = @client.text_messages.build(text_message_params)
    @text_message.incoming_message = false
    @text_message.sentstatus = false

    if @text_message.save
      flash[:notice] = "Success! Text Message was saved."
      @text_message.send_text_message(@text_message.content)
      redirect_to @client  
    else
      flash[:error] = "There was an error saving the text message. Please try again."
      render :new
    end
  end

  # def update
 
    # @text_message = TextMessage.find(params[:id]) 

   #if @text_message.sentstatus == true
      # @text_message.send_text_message
  # end
  # end 

  private

  def text_message_params
    params.require(:text_message).permit(:content, :scheduled_date, :client_id, :sentstatus)
  end  

end
