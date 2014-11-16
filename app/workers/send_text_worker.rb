class SendTextWorker
  include Sidekiq::Worker

  def perform(text_message_id)
    text_message = Text_Message.find(text_message_id)
    TextMessage.new(text_message).send_text_message
  end
end