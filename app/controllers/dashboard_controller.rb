class DashboardController < ApplicationController
    before_filter :require_current_user

    def index
        @current_user_rooms = Room.find_all_by_user_id(current_user.id)
        @current_user_roommates = Roommate.find_all_by_user_id(current_user.id)
        @messages_received = Message.find_all_by_to_user_id(current_user.id)
        if @messages_received
            @current_user_conversations = Array.new
            @messages_received.each do |message|
                @current_user_conversations.push message.conversation_id
                @current_user_unique_conversations = @current_user_conversations.uniq
            end
        end
        @messages_to_display = Array.new
        if @current_user_unique_conversations
            @current_user_unique_conversations.each do |id|
                current_message = Message.find_last_by_conversation_id(id)
                @messages_to_display.push current_message
            end
        end
        @messages_to_display = @messages_to_display.sort_by{|e| e.updated_at}.reverse
    end
end
