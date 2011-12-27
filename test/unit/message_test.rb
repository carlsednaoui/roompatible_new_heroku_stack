require 'test_helper'

class MessageTest < ActiveSupport::TestCase
    def setup
        @user_1 = User.create
        @user_1_id = @user_1.id
        @user_2 = User.create
        @user_2_id = @user_2.id
        @user_3 = User.create
        @user_3_id = @user_3.id
        @message = "foo"
        @reply = "bar"
    end

    def teardown
        @user_1 = nil
        @user_2 = nil
        @message = nil
    end

    test "creating a conversation between two users" do
        Message.initiate_message(@user_1_id, @user_2_id, @message)
        @last_convo = Conversation.last
        @last_convo_id = @last_convo.id
        @last_msg = Message.last
        assert_equal @last_msg.from_user_id, @user_1.id
        assert @last_msg.from_user_id.eql? @user_1.id
        assert @last_msg.to_user_id.eql? @user_2.id
        assert @last_msg.body.eql? @message
        assert @last_msg.conversation_id.eql? @last_convo.id
    end

    test "repond to a message" do
        Message.reply_to_a_message(@user_1_id, @user_2_id, @last_convo_id, @reply)
        @last_reply = Message.last
        assert @last_reply.from_user_id.eql? @user_1.id
        assert @last_reply.to_user_id.eql? @user_2.id
        assert @last_reply.body.eql? @reply
        assert @last_reply.conversation_id.eql? @last_convo_id
        assert @last_convo_id.eql? @last_reply.conversation_id 
    end

    test "user has unread messages" do
        assert @user_1.unread_messages.size.eql? 0
        assert @user_2.unread_messages.size.eql? 0
        Message.initiate_message(@user_1_id, @user_2_id, @message)
        @unread_messages = @user_1.unread_messages
        @unread_messages_2 = @user_2.unread_messages
        assert @unread_messages.size.eql? 0
        assert @unread_messages_2.size.eql? 1
    end

end
