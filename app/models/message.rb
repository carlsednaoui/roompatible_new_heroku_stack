class Message < ActiveRecord::Base
    belongs_to :conversation
    has_one :conversation
    belongs_to :user

    def self.initiate_message(from_user_id, to_user_id, body)
        new_conversation = Conversation.new 
        begin
            new_conversation.save!
        rescue
        end
        new_message = Message.new
        new_message.from_user_id = from_user_id
        new_message.to_user_id = to_user_id
        new_message.body = body
        new_message.conversation_id = new_conversation.id
        begin
            new_message.save!
        rescue
        end
    end

    def self.reply_to_a_message(from_user_id, to_user_id, conversation_id, body)
        new_message = Message.new
        new_message.from_user_id = from_user_id
        new_message.to_user_id = to_user_id
        new_message.body = body
        new_message.conversation_id = conversation_id
        begin
            new_message.save!
        rescue
        end
    end
end
