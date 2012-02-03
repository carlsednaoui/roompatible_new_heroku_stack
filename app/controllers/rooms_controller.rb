class RoomsController < ApplicationController
    before_filter :require_current_user, :except => [:index, :show]
    before_filter :require_room_belongs_to_current_user, :only => [:edit, :update, :destroy]

    def index
            @rooms = Room.find_all_by_room_active('t')
        if params[:search].present?
            @locations = Location.near(params[:search], 10, :order => :distance)
            @nearby_rooms = Array.new
            @locations.each do |location|
                room_id = location.room_id
                @nearby_rooms.push room_id
            end
            @nearby_rooms = @nearby_rooms.uniq
            @rooms = Room.find_all_by_id(@nearby_rooms)
        else
		@rooms = @rooms
        end

        @rooms = @rooms.sort_by{|e| e.updated_at}.reverse
        @rooms = Kaminari.paginate_array(@rooms).page(params[:page]).per(10)
        
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @rooms }
        end
    end

    def show
        @room = Room.find(params[:id])
        if @room.address.present?
            @room_location = Location.find_all_by_room_id(@room.id).last
            @city = @room_location.city
            #@json = @room_location.to_gmaps4rails
            #add this to views room show: <%= gmaps4rails(@json) %>
            @circles_json = @room_location.to_gmaps4rails.chop.chop + ", \"radius\": 100}]"

        end

        if current_user
            @user_1 = current_user.id
            @user_2 = @room.user_id
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


            respond_to do |format|
                format.html # show.html.erb
                format.xml  { render :xml => @room }
            end
        end
    end

    def new
        @room = Room.new

        3.times {@room.assets.build}

        @price_per_week_month = ["Monthly", "Weekly"]    
        @desired_gender = ["Male or Female", "Male", "Female"]
        @desired_length_of_stay_number = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        @desired_length_of_stay_week_month = ["Months", "Weeks"]    
        @desired_length_of_stay_more_less = ["or more", "or less"]    

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @room }
        end
    end

    def edit

        @pictures_uploaded = @room.assets.count
        @pictures_left = 3 - @pictures_uploaded
        @pictures_left.times {@room.assets.build}

        @price_per_week_month = ["Monthly", "Weekly"]
        @desired_gender = ["Male or Female", "Male", "Female"]
        @desired_length_of_stay_number = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        @desired_length_of_stay_week_month = ["Months", "Weeks"]
        @desired_length_of_stay_more_less = ["or more", "or less"]
    end

    def create
        @room = Room.new(params[:room])
        @room.user = current_user

        @price_per_week_month = ["Monthly", "Weekly"]
        @desired_gender = ["Male or Female", "Male", "Female"]
        @desired_length_of_stay_number = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        @desired_length_of_stay_week_month = ["Months", "Weeks"]
        @desired_length_of_stay_more_less = ["or more", "or less"]

        respond_to do |format|
            if @room.save
                format.html { redirect_to(@room, :notice => 'Room was successfully created.') }
                format.xml  { render :xml => @room, :status => :created, :location => @room }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
            end
        end
	#TO DELETE
        #Location.new_location(@room.address, @room.id)
    end

    def update
        @price_per_week_month = ["Monthly", "Weekly"]
        @desired_gender = ["Male or Female", "Male", "Female"]
        @desired_length_of_stay_number = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        @desired_length_of_stay_week_month = ["Months", "Weeks"]
        @desired_length_of_stay_more_less = ["or more", "or less"]

        respond_to do |format|
            if @room.update_attributes(params[:room])
                format.html { redirect_to(@room, :notice => 'Room was successfully updated.') }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
            end
        end
        Location.new_location(@room.address, @room.id)
    end

    def destroy
        @room.destroy

        respond_to do |format|
            format.html { redirect_to(rooms_url) }
            format.xml  { head :ok }
        end
    end

    def require_room_belongs_to_current_user
        @room = current_user.rooms.find(params[:id])
    end
end
