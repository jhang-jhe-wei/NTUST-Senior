# frozen_string_literal: true

class GuidesController < ApplicationController
  def share_bot; end

  def other
    last_response = Rails.cache.read("last-reponse-#{current_user.line_id}") || ''
    response = OpenAIClient.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: last_response + params[:other],
        max_tokens: 1000
      }
    )

    @reply_text = response['choices'].map { |c| c['text'] }.join('').strip
    Rails.cache.write("last-reponse-#{current_user.line_id}", @reply_text, expires_in: 30.minutes)
  end
end
