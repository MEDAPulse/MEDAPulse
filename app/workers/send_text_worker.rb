class SendTextWorker
  include Sidekiq::Worker

  def perform(text_message_id)
    text_message = Text_Message.find(text_message_id)
    SendText.new(text_message_id).send_text_message
  end
end