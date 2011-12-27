class MessagesController < ApplicationController
    def show
        @current_message = Message.find_by_id(params["id"])
        @current_message_conversation_id = @current_message.conversation_id
        @message_reply_to_user_id = @current_message.from_user_id
        if @message_reply_to_user_id.eql? current_user.id
            @message_reply_to_user_id = @current_message.to_user_id
        end
        @view_conversation = Message.find_all_by_conversation_id(@current_message_conversation_id)
        @view_conversation = @view_conversation.sort_by{|e| e.created_at}.reverse
        
        @messages_to_current_user = Message.find_all_by_to_user_id_and_conversation_id(current_user.id, @current_message_conversation_id)
        @messages_to_current_user.each do |msg|
            msg.last_read_timestamp = Time.new
            begin
                msg.save!
            rescue
            end
        end

        if current_user
            @user_1 = current_user.id
            @user_2 = @message_reply_to_user_id
        end
            @score = CompatibilityAlgorithm.get_score(@user_1, @user_2).to_i
            @same_quiz = CompatibilityAlgorithm.same_quiz_test(@user_1, @user_2)
            @all_questions_id = CompatibilityAlgorithm.all_questions_id(@same_quiz)
            @all_traits_id = CompatibilityAlgorithm.all_traits_id(@all_questions_id).uniq

            @user_1_last_quiz_attempt = QuizAttempt.find_all_by_user_id(@user_1).last
            @user_2_last_quiz_attempt = QuizAttempt.find_all_by_user_id(@user_2).last
            @user_1_responses = QuizAttemptResponse.find_all_by_quiz_attempt_id(@user_1_last_quiz_attempt)
            @user_2_responses = QuizAttemptResponse.find_all_by_quiz_attempt_id(@user_2_last_quiz_attempt)
            @score_traits = CompatibilityAlgorithm.score_traits(@user_1_responses, @user_2_responses, @all_traits_id)

            @cleanliness = @score_traits["cleanliness"].to_i
            @sociability = @score_traits["sociability"].to_i
            @lifestyle = @score_traits["lifestyle"].to_i
            @expectation = @score_traits["expectation"].to_i
    end

    def new
        @to_user_id = params["to_user_id"]
    end

    def message_sent
        @from_user_id = params["from_user_id"]
        @to_user_id = params["to_user_id"]
        @body = params["body"]
        @current_user_has_already_initiated_a_conversation_with_room_user = Message.find_all_by_from_user_id_and_to_user_id(@from_user_id, @to_user_id)
        @room_user_has_already_initiated_a_conversation_with_current_user = Message.find_all_by_to_user_id_and_from_user_id(@from_user_id, @to_user_id)
        if @current_user_has_already_initiated_a_conversation_with_room_user.eql? [] and @room_user_has_already_initiated_a_conversation_with_current_user.eql? []
            Message.initiate_message(@from_user_id, @to_user_id, @body)
        else
            if @current_user_has_already_initiated_a_conversation_with_room_user.eql? []
                @current_conversation_id = @room_user_has_already_initiated_a_conversation_with_current_user.last.conversation_id
            else
                @current_conversation_id = @current_user_has_already_initiated_a_conversation_with_room_user.last.conversation_id
            end
            Message.reply_to_a_message(@from_user_id, @to_user_id, @current_conversation_id, @body)
        end
    end

end
