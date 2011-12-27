class TakeController < ApplicationController
    skip_before_filter :new_user_has_to_take_quiz
    before_filter :require_current_user
    def new
        @last_quiz = Quiz.last
        @quiz_attempt = @last_quiz
        @form_questions = Question.find_all_by_quiz_id(@quiz_attempt.id)
        @origin = params['origin']
    end 

    def complete
        @has_errors = false
        @current_user = current_user
        @current_user_name = @current_user.name

        @new_quiz_attempt = QuizAttempt.new
            @new_quiz_attempt.user_id = current_user.id
            @new_quiz_attempt.quiz_id = params['quiz_attempt_id']
             begin
                @new_quiz_attempt.save!
            rescue
            end 

        @question = params['question']
        @question.keys.each do |key|
            question_id = key
            result = @question[key]
            response = QuizAttemptResponse.new
            response.question_id = key
            response.value = result
            response.quiz_attempt_id = @new_quiz_attempt.id 
            begin
                response.save!
            rescue
            end
        end
#        @user_url = "http://www.roompatible.com/take?origin=" + @new_user.id.to_s
#        if @has_errors.eql? true
#            flash[:warning] = @new_user.errors.full_messages.join(", ")
#            redirect_to "/take"
#        elsif params['origin'] != ""
#            redirect_to "/score?" + "user_id_1=" + params['origin'] + "&user_id_2=" + @new_user.id.to_s
#        end
    end

    def notify
        @email = params['user']['email']
        @user_id = params['user']['id']
        @user = User.find_by_id(@user_id)
        @user.email = @email
        begin
            @user.save!
        rescue
        end
        puts @user.inspect
    end
end
