class HomeController < ApplicationController
    def index 
    end

    def score
        @user_1 = params['user_id_1']
        @user_2 = params['user_id_2']
        @user_1_name = User.find_by_id(@user_1).name.capitalize
        @user_2_name = User.find_by_id(@user_2).name.capitalize
        @user_1_responses = Response.find_all_by_user_id(@user_1)
        @user_2_responses = Response.find_all_by_user_id(@user_2)
        @score = CompatibilityAlgorithm.get_score(@user_1, @user_2).to_i

        @same_quiz = CompatibilityAlgorithm.same_quiz_test(@user_1, @user_2)
        @all_questions_id = CompatibilityAlgorithm.all_questions_id(@same_quiz)
        @all_traits_id = CompatibilityAlgorithm.all_traits_id(@all_questions_id).uniq
        @score_traits = CompatibilityAlgorithm.score_traits(@user_1_responses, @user_2_responses, @all_traits_id)
        @cleanliness = @score_traits["cleanliness"].to_i
        @consideration = @score_traits["consideration"].to_i
        @sociability = @score_traits["sociability"].to_i
        @fitness = @score_traits["fitness"].to_i
        @curiosity = @score_traits["curiosity"].to_i
    end

    def what_is_roompatible
    end
  
    def how_it_works
    end
    
    def contact
    end
end
