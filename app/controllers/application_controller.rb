class ApplicationController < ActionController::Base
    before_filter :new_user_has_to_take_quiz



    unless Rails.application.config.consider_all_requests_local
	    rescue_from Exception :with => :render_500
	    rescue_from ActionController::RoutingError :with => :render_404
	    rescue_from ActionController::UnknownController :with => :render_404
	    rescue_from ActionController::UnknownAction :with => :render_404
	    rescue_from ActiveRecord::RecordNotFound :with => :render_404
    end

    private
    def render_404(exception)
	    @not_found_path = exception.message
	    respond_to do |format|
		    format.html { render :template => 'errors/error_404', :status => 404 }
		    format.all { render :nothing => true, :status => 404 }
	    end
    end

    def render_500(exception)
	    @error = exception
	    respond_to do |format|
		    format.html { render :template => 'errors/error_500', :status => 500 }
		    format.all { render :nothing => true, :status => 500}
	    end
    end

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



#  before_filter :ensure_domain

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
