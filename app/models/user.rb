class User < ActiveRecord::Base
    has_many :quiz_attempts
    has_many :rooms
    has_many :roommates
    has_many :messages

# Class methods go here

    def self.create_with_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"]["name"]
            user.nickname = auth["info"]["nickname"]
        end
    end

# Instance methods go here (instance methods speak to a single, solitary, object at a time).

    def unread_messages
        @unread_messages = Message.find_all_by_to_user_id_and_last_read_timestamp(self.id, nil) 
    end
    
end
