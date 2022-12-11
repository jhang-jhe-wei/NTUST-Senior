# frozen_string_literal: true

class GuidesController < ApplicationController
  after_action :cache_conversation_records, only: :other

  def share_bot; end

  def reset_chatting
    Rails.cache.write("last-reponse-#{current_user.line_id}", nil)
  end

  def other
    append_conversation_record(params[:other])
    response = OpenAIClient.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: conversation_records.join,
        max_tokens: 1000
      }
    )

    @reply_text = response['choices'].map { |c| c['text'] }.join('').strip
    append_conversation_record(@reply_text)
  end

  private

  def cache_conversation_records
    Rails.cache.write(
      "chatting-histories-#{current_user.line_id}",
      conversation_records,
      expires_in: 30.minutes
    )
  end

  def conversation_records
    @conversation_records ||= Rails.cache.read("chatting-histories-#{current_user.line_id}") || []
  end

  def append_conversation_record(str)
    conversation_records.shift if conversation_records.size >= 20
    conversation_records << str
  end
end
