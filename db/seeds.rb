q = Quiz.create( :name => 'roompatible')
trait_cleanliness = Trait.create( :name => 'cleanliness')
trait_sociability = Trait.create( :name => 'sociability')
trait_lifestyle = Trait.create( :name => 'lifestyle')
trait_expectation = Trait.create( :name => 'expectation')

q_1 = Question.create( :quiz_id => q.id, :prompt => 'How long do you take to shower?', :choice_1 => 'Less than 10 mns', :choice_2 => 'About 15 mns', :choice_3 => 'Nearly half an hour', :choice_4 => 'More than half an hour', :choice_5 => 'Nearly an hour', :total_choices => 5)

q_1.traits << trait_expectation

q_2 = Question.create( :quiz_id => q.id, :prompt => 'When was the last time you cleaned your bathroom?', :choice_1 => 'Funny you ask, I just did so!', :choice_2 => 'About a week ago', :choice_3 => 'Sometime last month', :choice_4 => 'Couple months ago', :choice_5 => 'What?', :total_choices => 5)

q_2.traits << trait_cleanliness

q_3 = Question.create( :quiz_id => q.id, :prompt => 'How many friends do you currently have on Facebook?', :choice_1 => 'Under 50 Facebook friends', :choice_2 => 'Between 51 and 199 Facebook friends', :choice_3 => 'Between 200 and 499 Facebook friends', :choice_4 => 'Between 500 and 999 Facebook friends', :choice_5 => 'Over 1000 Facebook friends', :total_choices => 5)

q_3.traits << trait_sociability

q_4 = Question.create( :quiz_id => q.id, :prompt => 'If you had couple of hours to spare right now, what would you rather do?', :choice_1 => 'Play video games', :choice_2 => 'Watch an episode of your favorite TV show', :choice_3 => 'Catch up with a friend or family member', :choice_4 => 'Continue reading that book', :choice_5 => 'Study or learn to do something new', :total_choices => 5)

q_4.traits << trait_lifestyle

q_5 = Question.create( :quiz_id => q.id, :prompt => 'How many countries have you visited?', :choice_1 => 'I have not been abroad, yet', :choice_2 => 'Between 2 to 4 countries', :choice_3 => 'Between 5 and 11 countries', :choice_4 => 'About a dozen countries or so', :choice_5 => 'More than I can count', :total_choices => 5)

q_5.traits << trait_lifestyle

q_6 = Question.create( :quiz_id => q.id, :prompt => 'Piercing or Tattoo?', :choice_1 => 'Both', :choice_2 => 'Tattoo', :choice_3 => 'Piercing', :choice_4 => 'Neither', :total_choices => 4)

q_6.traits << trait_lifestyle

q_7 = Question.create( :quiz_id => q.id, :prompt => 'If you had to choose, what would you be most likely to do right now?', :choice_1 => 'Go to the gym', :choice_2 => 'Go for a jog', :choice_3 => 'Go to a yoga class', :choice_4 => 'Do some other sport activity', :choice_5 => 'None of the above', :total_choices => 5)

q_7.traits << trait_lifestyle

q_8 = Question.create( :quiz_id => q.id, :prompt => 'In general, what do you prefer?', :choice_1 => 'Movies at home', :choice_2 => 'Movies at the theatre', :choice_3 => 'Outdoor concerts', :choice_4 => 'Bars', :choice_5 => 'Nightclubs', :total_choices => 5)

q_8.traits << trait_lifestyle

q_9 = Question.create( :quiz_id => q.id, :prompt => 'How do you feel about your career?', :choice_1 => 'What career?', :choice_2 => 'I work because I have too', :choice_3 => 'I love my job', :choice_4 => 'I want to have my own company (or already do)', :total_choices => 4)

q_9.traits << trait_expectation

q_10 = Question.create( :quiz_id => q.id, :prompt => 'Do you usually keep your room door closed?', :choice_1 => 'Yes, and I lock it', :choice_2 => 'Yes, most of the time', :choice_3 => 'Sometimes I do, but not always', :choice_4 => 'No way, my door is always open', :choice_5 => 'Door? Please, I have curtains', :total_choices => 5)

q_10.traits << trait_sociability

q_11 = Question.create( :quiz_id => q.id, :prompt => 'How would you best describe yourself?', :choice_1 => 'Really outgoing', :choice_2 => 'Somewhat outgoing', :choice_3 => 'Somewhat reserved', :choice_4 => 'Pretty shy', :total_choices => 4)

q_11.traits << trait_sociability

q_12 = Question.create( :quiz_id => q.id, :prompt => 'Do you feel comfortable using a drill and a hammer?', :choice_1 => 'Yes, definitely', :choice_2 => 'Somewhat comfortable', :choice_3 => 'No, not at all', :total_choices => 3)

q_12.traits << trait_lifestyle

q_13 = Question.create( :quiz_id => q.id, :prompt => 'How do you feel about cooking?', :choice_1 => 'I hate cooking', :choice_2 => 'I cook because I have to', :choice_3 => 'It is fun, but I am not very good at it', :choice_4 => 'I enjoy it and cook when I have time', :choice_5 => 'Cooking is my religion', :total_choices => 5)

q_13.traits << trait_lifestyle

q_14 = Question.create( :quiz_id => q.id, :prompt => 'Do you have any siblings?', :choice_1 => 'Yes', :choice_2 => 'No, but I wish I did', :choice_3 => 'No', :total_choices => 3)

q_14.traits << trait_lifestyle

q_15 = Question.create( :quiz_id => q.id, :prompt => 'What do you look for in a roommate/ housemate? (aside from cost saving)', :choice_1 => 'Create a second family', :choice_2 => 'Someone to party with', :choice_3 => 'Nothing much, so long as the person respects my privacy', :choice_4 => 'Just split the rent. Nothing else.', :total_choices => 4)

q_15.traits << trait_expectation

q_16 = Question.create( :quiz_id => q.id, :prompt => 'How would you describe your shopping habits?', :choice_1 => 'Shopping is my therapy!', :choice_2 => 'If something fits me well, I tend to buy it.', :choice_3 => 'Meeh... I dont really like to go shopping.', :total_choices => 3)

q_16.traits << trait_lifestyle

q_17 = Question.create( :quiz_id => q.id, :prompt => 'How do you feel about sharing your food?', :choice_1 => 'What is mine, is mine. Period.', :choice_2 => 'I dont mind sharing my food as long as you buy more of what you took', :choice_3 => 'Go for it, my food is your food. I dont care what you take', :total_choices => 3)

q_17.traits << trait_expectation

q_18 = Question.create( :quiz_id => q.id, :prompt => 'How often do you shower?', :choice_1 => 'Twice a day', :choice_2 => 'At least once a day', :choice_3 => 'Usually once a day', :choice_4 => 'Every other day or so', :choice_5 => 'Couple times a week', :total_choices => 5)

q_18.traits << trait_cleanliness

q_19 = Question.create( :quiz_id => q.id, :prompt => 'How often do you brush your teeths?', :choice_1 => 'Twice a day', :choice_2 => 'At least once a day', :choice_3 => 'Usually once a day', :choice_4 => 'Every other day or so', :total_choices => 4)

q_19.traits << trait_cleanliness


#user_1 = User.create( :name => 'test_user_1', :nickname => 'user_1')
#user_2 = User.create( :name => 'test_user_2', :nickname => 'user_2')
#user_3 = User.create( :name => 'test_user_3', :nickname => 'user_3')
#user_4 = User.create( :name => 'test_user_4', :nickname => 'user_4')

#quiz_attempt_1_user_1 = QuizAttempt.create( :quiz_id => q.id, :user_id => user_1.id)
#quiz_attempt_1_user_2 = QuizAttempt.create( :quiz_id => q.id, :user_id => user_2.id)
#quiz_attempt_1_user_3 = QuizAttempt.create( :quiz_id => q.id, :user_id => user_3.id)
#quiz_attempt_1_user_4 = QuizAttempt.create( :quiz_id => q.id, :user_id => user_4.id)

#room_1 = Room.create( :title => 'This is my awesome room title!', :description => 'This is my awesome room!! You should check it out yo!', :user_id => user_1.id, :price => 1500, :address => "", :desired_length_of_stay => 2, :desired_gender => 'male', :couples_allowed => 0, :smoking_on_premise => 0, :pets_on_premise => "no", :amenities_ac => 0, :amenities_heater =>1, :amenities_cable_tv => 0, :amenities_internet =>0, :amenities_kitchen =>1, :amenities_washer =>1, :amenities_backyard =>0, :amenities_balcony => 0, :amenities_rooftop =>1, :amenities_elevator => 0, :amenities_smoking_allowed => 0, :amenities_pets_allowed => 1,  :rent_time => 'month', :stay_time => 'bar', :stay_time_details => 'foo', :contact_info => 'foobar' )

#room_2 = Room.create( :title => 'This is my awesome room title!', :description => 'This is my awesome room!! You should check it out yo!', :user_id => user_2.id, :price => 1500, :address => "", :desired_length_of_stay => 2, :desired_gender => 'male', :couples_allowed => 0, :smoking_on_premise => 0, :pets_on_premise => "no", :amenities_ac => 0, :amenities_heater =>1, :amenities_cable_tv => 0, :amenities_internet =>0, :amenities_kitchen =>1, :amenities_washer =>1, :amenities_backyard =>0, :amenities_balcony => 0, :amenities_rooftop =>1, :amenities_elevator => 0, :amenities_smoking_allowed => 0, :amenities_pets_allowed => 1,  :rent_time => 'month', :stay_time => 'bar', :stay_time_details => 'foo', :contact_info => 'foobar')

#room_3 = Room.create( :title => 'This is my awesome room title!', :description => 'This is my awesome room!! You should check it out yo!', :user_id => user_3.id, :price => 1500, :address => "", :desired_length_of_stay => 2, :desired_gender => 'male', :couples_allowed => 0, :smoking_on_premise => 0, :pets_on_premise => "no", :amenities_ac => 0, :amenities_heater =>1, :amenities_cable_tv => 0, :amenities_internet =>0, :amenities_kitchen =>1, :amenities_washer =>1, :amenities_backyard =>0, :amenities_balcony => 0, :amenities_rooftop =>1, :amenities_elevator => 0, :amenities_smoking_allowed => 0, :amenities_pets_allowed => 1,  :rent_time => 'month', :stay_time => 'bar', :stay_time_details => 'foo', :contact_info => 'foobar')

#room_4 = Room.create( :title => 'This is my awesome room title!', :description => 'This is my awesome room!! You should check it out yo!', :user_id => user_4.id, :price => 1500, :address => "", :desired_length_of_stay => 2, :desired_gender => 'male', :couples_allowed => 0, :smoking_on_premise => 0, :pets_on_premise => "no", :amenities_ac => 0, :amenities_heater =>1, :amenities_cable_tv => 0, :amenities_internet =>0, :amenities_kitchen =>1, :amenities_washer =>1, :amenities_backyard =>0, :amenities_balcony => 0, :amenities_rooftop =>1, :amenities_elevator => 0, :amenities_smoking_allowed => 0, :amenities_pets_allowed => 1,  :rent_time => 'month', :stay_time => 'bar', :stay_time_details => 'foo', :contact_info => 'foobar')
