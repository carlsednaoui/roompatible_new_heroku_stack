module CompatibilityAlgorithm
    @scoring_table_5_answers = {0=>100, 1=>75, 2=>50, 3=>25, 4=>10}
    @scoring_table_4_answers = {0=>100, 1=>65, 2=>35, 3=>10}
    @scoring_table_3_answers = {0=>100, 1=>50, 2=>10}
    @scoring_table_2_answers = {0=>100, 1=>10}

    def self.same_quiz_test(user_1_id, user_2_id)
        quiz_1_id = get_quiz_id(user_1_id)
        quiz_2_id = get_quiz_id(user_2_id)
        if quiz_1_id == quiz_2_id
            equal = quiz_1_id
        else
            equal = nil
        end
        return equal
    end
    
    def self.get_quiz_id(user_id)
        quiz_id = QuizAttempt.find_by_user_id(user_id).quiz_id
        return quiz_id
    end

    def self.get_score_deprecated(user_id_1, user_id_2)
        user_1_responses = Response.find_all_by_user_id(user_id_1)
        user_2_responses = Response.find_all_by_user_id(user_id_2)
        score = compare(user_1_responses, user_2_responses)
        return score
    end

    def self.get_score(user_id_1, user_id_2)
        user_1_responses = QuizAttempt.find_all_by_user_id(user_id_1).last.quiz_attempt_responses
        user_2_responses = QuizAttempt.find_all_by_user_id(user_id_2).last.quiz_attempt_responses
        score = compare(user_1_responses, user_2_responses)
        return score
    end

    def self.score_traits(responses_1, responses_2, traits_ids)
        traits_results = Hash.new
        traits_ids.each do |t_id|
            trait = Trait.find_by_id(t_id)
            filtered_responses_1 = responses_1.map{|response| response if response.question.traits.include? trait}.compact
            filtered_responses_2 = responses_2.map{|response| response if response.question.traits.include? trait}.compact
            trait_score = compare(filtered_responses_1, filtered_responses_2)
            puts trait.name + " " + trait_score.to_s
            traits_results[trait.name]=trait_score
        end 
        return traits_results
    end

    def self.compare(responses_1, responses_2)
        all_scores = Array.new
        counter = 0
        responses_1.each do |response_1|
            response_2 = responses_2[counter]
            if (response_1.question_id.eql? response_2.question_id)
                value_1 = answer_letter_to_number(response_1.value)
                value_2 = answer_letter_to_number(response_2.value)
                distance = value_1 - value_2
                abs_distance = distance.abs
                number_of_answers = Question.find_by_id(response_1.question_id).total_choices 
                temp_score = get_question_score(number_of_answers, abs_distance)
                all_scores.push temp_score
            else
                puts "--> Invalid"
                return nil
            end
            counter = counter + 1
        end
        average_score = all_scores.inject{ |sum, el| sum + el }.to_f / all_scores.size
        return average_score
    end

    def self.answer_letter_to_number(answer)
        if answer == "a"
            value = 1
        elsif answer == "b"
            value = 2
        elsif answer == "c"
            value = 3
        elsif answer == "d"
            value = 4
        elsif answer == "e"
            value = 5
        else
            value = 0
        end
        return value
    end
    
    def self.get_question_score(number_of_answers, distance)
        result = nil
        if number_of_answers == 5
           result = @scoring_table_5_answers[distance]
        elsif
            number_of_answers == 4 
            result = @scoring_table_4_answers[distance]
        elsif
            number_of_answers == 3 
            result = @scoring_table_3_answers[distance]
        elsif
            number_of_answers == 2
            result = @scoring_table_2_answers[distance]
        else
            result = nil
        end
        return result
    end
    
    def self.all_questions_id(quiz_id)
        questions_id = Array.new
        all_questions = Question.find_all_by_quiz_id(quiz_id)
        all_questions.each do |question|
            questions_id.push question.id
        end
        return questions_id
    end

    def self.all_traits_id(all_questions_id)
    all_traits_id = Array.new
    all_questions_id.each do |question_id|
        q_id = QuestionsTraits.find_all_by_question_id(question_id)
        q_id.each do |get_trait|
            get_trait = get_trait.trait_id
            all_traits_id.push get_trait
        end
    end
      return all_traits_id
    end 
end
