class ApplicationController < ActionController::Base
  before_action :set_score

  def set_score
    session[:score] ||= 0
  end
end
