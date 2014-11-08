class TextMessagesController < ApplicationController
  
  def new
    @client = current_user.clients.find(params[:client_id])
    @text_message = @client.text_messages.build
  end

  def create
    @client = current_user.clients.find(params[:client_id])
    content = params[:text_message][:content]
    # # Commented out the following 2 lines for debugging only.
    # message_sent = Twilio.send_message(@client.phone, content)
    #
    # if message_sent
      @text_message = @client.text_messages.build(text_message_params)
      @text_message.incoming_message = false
      if @text_message.save
        flash[:notice] = "Success! Text Message was saved."
        # After saving the record, we're mapping back to @client's show
        # view. If we want to land back on the action_view like all of the
        # other data, ...and I assume we do, we need to create a relationship
        # between TextMessages and ActionPlan so that we can map back to 
        # @action_plan's show view.  Let's discuss.
        redirect_to @client  
      else
        flash[:error] = "There was an error saving the text message. Please try again."
        render :new
      end
    # end  <-- also commented out for debuggin'

  end  

  private

  def text_message_params
    params.require(:text_message).permit(:content, :scheduled_date, :client_id)
  end  

end
