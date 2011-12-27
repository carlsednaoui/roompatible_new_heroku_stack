class ApplicationController < ActionController::Base
    before_filter :new_user_has_to_take_quiz

    def new_user_has_to_take_quiz
        if current_user
            find_quiz_attempt = QuizAttempt.find_by_user_id(current_user.id)
            if find_quiz_attempt.nil? 
                flash[:notice] = "You are almost there."
                redirect_to "/take"
            end
        end
    end

    protect_from_forgery
    helper_method :current_user



  before_filter :ensure_domain

    APP_DOMAIN = 'www.roompatible.com'
    def ensure_domain
      if request.env['HTTP_HOST'] != APP_DOMAIN
        redirect_to "http://#{APP_DOMAIN}", :status => 301
      end
    end

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]        
    end
    
    def require_current_user
        unless current_user
            flash[:error] = "You must be logged in"
            redirect_to root_path
        end
    end
end
