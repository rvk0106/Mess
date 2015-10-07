class WelcomeController < ApplicationController
  def index
  end
  def get_semister_subject_checkbox
    @course = Course.where(:university_id => params[:id].to_i).first
    render :partial => "semister_subjects"
  end
end
