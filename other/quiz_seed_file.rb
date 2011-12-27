q = Quiz.create( :name => 'roompatible')

Question.create( :quiz_id => q.id, :prompt => 'How long do you take to shower?', :choice_1 => 'Less than 10 mns', :choice_2 => 'About 15 mns', :choice_3 => 'Nearly half an hour', :choice_4 => 'More than half an hour', :choice_5 => 'Nearly an hour', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'How would you describe yourself?', :choice_1 => 'A morning person', :choice_2 => 'An evening person', :total_choices => 2)

Question.create( :quiz_id => q.id, :prompt => 'When was the last time you cleaned your bathroom?', :choice_1 => 'Funny you ask, I just did so!', :choice_2 => 'About a week ago', :choice_3 => 'Sometime last month', :choice_4 => 'Couple months ago', :choice_5 => 'What?', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'How many friends do you currently have on Facebook?', :choice_1 => 'Under 50 Facebook friends', :choice_2 => 'Between 51 and 199 Facebook friends', :choice_3 => 'Between 200 and 499 Facebook friends', :choice_4 => 'Between 500 and 999 Facebook friends', :choice_5 => 'Over 1000 Facebook friends', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'If you had couple of hours to spare right now, what would you rather do?', :choice_1 => 'Watch an episode of your favorite TV show', :choice_2 => 'Continue reading that book', :choice_3 => 'Catch up with a friend or family member', :choice_4 => 'Watch a bunch of TED videos', :choice_5 => 'Study or learn to do something new', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'How many countries have you visited?', :choice_1 => 'I have not been abroad, yet', :choice_2 => 'Between 2 to 4 countries', :choice_3 => 'Between 5 and 11 countries', :choice_4 => 'About a dozen countries or so', :choice_5 => 'More than I can count', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'Piercing or Tattoo?', :choice_1 => 'Both', :choice_2 => 'Neither', :choice_3 => 'Piercing', :choice_4 => 'Tattoo', :total_choices => 4)

Question.create( :quiz_id => q.id, :prompt => 'If you had to choose, what would you be most likely to do right now?', :choice_1 => 'Go to the gym', :choice_2 => 'Go for a jog', :choice_3 => 'Go to a yoga class', :choice_4 => 'Do some other sport activity', :choice_5 => 'None of the above', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'In general, what do you prefer?', :choice_1 => 'Movies at home', :choice_2 => 'Movies at the theatre', :choice_3 => 'Outdoor concerts', :choice_4 => 'Bars', :choice_5 => 'Nightclubs', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'Do you usually keep your room door closed?', :choice_1 => 'Yes, and I lock it', :choice_2 => 'Yes, most of the time', :choice_3 => 'Sometimes I do, but not always', :choice_4 => 'No way, my door is always open', :choice_5 => 'Door? Please, I have curtains', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'What is mightier?', :choice_1 => 'The pen', :choice_2 => 'The sword', :choice_3 => 'Words', :total_choices => 3)

Question.create( :quiz_id => q.id, :prompt => 'Do you feel comfortable using a drill and a hammer?', :choice_1 => 'Yes, definitely', :choice_2 => 'Somewhat comfortable', :choice_3 => 'No, not at all', :total_choices => 3)

Question.create( :quiz_id => q.id, :prompt => 'How do you feel about cooking?', :choice_1 => 'I hate cooking', :choice_2 => 'I cook because I have to', :choice_3 => 'It is fun, but I am not very good at it', :choice_4 => 'I enjoy it and cook when I have time', :choice_5 => 'Cooking is my religion', :total_choices => 5)

Question.create( :quiz_id => q.id, :prompt => 'Do you have any siblings?', :choice_1 => 'Yes, many of them', :choice_2 => 'Yes, a brother and a sister', :choice_3 => 'No, but I wish I did', :choice_4 => 'No', :total_choices => 4)

Question.create( :quiz_id => q.id, :prompt => 'What do you look for in a roommate/ housemate?', :choice_1 => 'Create a second family', :choice_2 => 'Someone to party with', :choice_3 => 'Nothing much, so long as the person respects my privacy', :choice_4 => 'Just split the rent', :total_choices => 4)

Question.create( :quiz_id => q.id, :prompt => 'How do you feel about sharing your food?', :choice_1 => 'What is mine, IS mine', :choice_2 => 'If you share, I share', :choice_3 => 'I dont mind sharing my food as long as they buy more of what they took', :choice_4 => 'Go for it, my food is your food', :total_choices => 4)

Question.create( :quiz_id => q.id, :prompt => 'What CULTURE do you best identify with?', :choice_1 => 'Latino or Middle Eastern', :choice_2 => 'Asian Pacific', :choice_3 => 'African American, Carribbean, African', :choice_4 => 'American or European', :choice_5 => 'Other', :total_choices => 5)

# Question.create( :quiz_id => q.id, :prompt => '', :choice_1 => '', :choice_2 => '', :choice_3 => '', :choice_4 => '', :choice_5 => '')
