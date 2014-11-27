class SendTextWorker
  include Sidekiq::Worker

  def perform(text_message_id)
    text = TextMessage.find(text_message_id)
    content = text.content
    phone = text.phone
    TextMessage.new.send_text_message(content, phone)
  end
end