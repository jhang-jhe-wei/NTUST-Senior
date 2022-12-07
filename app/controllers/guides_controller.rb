# frozen_string_literal: true

class GuidesController < ApplicationController
  def share_bot; end

  def other
    client = OpenAI::Client.new
    response = client.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: params[:other],
        max_tokens: 4000
      }
    )

    @reply_text = response['choices'].map { |c| c['text'] }.join('').strip!
  end
end
