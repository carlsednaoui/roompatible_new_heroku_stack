class RoommatesController < ApplicationController
    before_filter :require_current_user, :except => [:index, :show]
    before_filter :require_roommate_belongs_to_current_user, :only => [:edit, :update, :destroy]
  
def index
    @roommates = Roommate.find_all_by_roommate_active('t')
    @roommates = @roommates.sort_by{|e| e.updated_at}.reverse
    @roommates = Kaminari.paginate_array(@roommates).page(params[:page]).per(10)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roommates }
    end
  end

  def show
    @roommate = Roommate.find(params[:id])

        if current_user
            @user_1 = current_user.id
            @user_2 = @roommate.user_id
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

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @roommate }
    end
  end

  def new
    @roommate = Roommate.new
    @desired_gender = ["Male or Female", "Male", "Female"]
    @gender = ["Male", "Female"]
    @sexual_orientation = ["Straight", "Bisexual", "Gay", ""]
    @max_renters = [2, 1, 3, 4]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @roommate }
    end
  end

  def edit
    @desired_gender = ["Male or Female", "Male", "Female"]
    @gender = ["Male", "Female"]
    @sexual_orientation = ["Straight", "Bisexual", "Gay", ""]
    @max_renters = [2, 1, 3, 4]
  end

  def create
    @roommate = Roommate.new(params[:roommate])
    @roommate.user = current_user

    @desired_gender = ["Male or Female", "Male", "Female"]
    @gender = ["Male", "Female"]
    @sexual_orientation = ["Straight", "Bisexual", "Gay", ""]
    @max_renters = [2, 1, 3, 4]

    respond_to do |format|
      if @roommate.save
        format.html { redirect_to(@roommate, :notice => 'Roommate was successfully created.') }
        format.xml  { render :xml => @roommate, :status => :created, :location => @roommate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @roommate.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    @desired_gender = ["Male or Female", "Male", "Female"]
    @gender = ["Male", "Female"]
    @sexual_orientation = ["Straight", "Bisexual", "Gay", ""]
    @max_renters = [2, 1, 3, 4]


    respond_to do |format|
      if @roommate.update_attributes(params[:roommate])
        format.html { redirect_to(@roommate, :notice => 'Roommate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @roommate.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @roommate = Roommate.find(params[:id])
    @roommate.destroy

    respond_to do |format|
      format.html { redirect_to(roommates_url) }
      format.xml  { head :ok }
    end
  end

    def require_roommate_belongs_to_current_user
        @roommate = current_user.roommates.find(params[:id])
    end
end
