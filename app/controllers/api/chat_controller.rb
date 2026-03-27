require 'net/http'
require 'json'

class Api::ChatController < ApplicationController
  def create
    user_message = params[:message]
    api_key = ENV['GEMINI_API_KEY']

    uri = URI("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=#{api_key}")

    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json'
    request.body = {
      contents: [{
        parts: [{ text: "You are a helpful assistant for Natrang, an Indian culture app. Answer questions about Indian festivals, traditions, dance forms, music, and culture. User asks: #{user_message}" }]
      }]
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    result = JSON.parse(response.body)
    answer = result.dig('candidates', 0, 'content', 'parts', 0, 'text')

    render json: { reply: answer }
  end
end