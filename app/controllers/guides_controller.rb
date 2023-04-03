# frozen_string_literal: true

class GuidesController < ApplicationController

  def share_bot; end

  def reset_chatting
    Rails.cache.write("last-reponse-#{current_user.line_id}", nil)
  end

  def other
    previouse_records = Rails.cache.read("chatting-histories-#{current_user.line_id}") || []
    messages = previouse_records.push({ role: "user", content: params[:other] })

    response = OpenAIClient.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        prompt: messages,
        temperature: 0.7
      }
    )

    @reply_text =
      if response.success?
        response.dig("choices", 0, "message", "content")
      else
        response.dig("error", "message")
      end
    new_messages = messages.push({ role: "assistant", content: @reply_text })
    cache_conversation_records(new_messages)
  end

  private

  def cache_conversation_records(messages)
    Rails.cache.write(
      "chatting-histories-#{current_user.line_id}",
      messages,
      expires_in: 30.minutes
    )
  end
end
