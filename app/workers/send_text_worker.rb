class SendTextWorker
  include Sidekiq::Worker
  sidekiq_options queue: :immediate

  def perform(text_message_id)
    text = TextMessage.find(text_message_id)
    content = text.content
    TextMessage.new.send_text_message(content)
  end
end