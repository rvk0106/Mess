class WelcomeController < ApplicationController
  def index
  end
  def get_semister_subject_checkbox
    @course = Course.where(:id => params[:id].to_i).first
    render :partial => "semister_subjects"
  end
end
