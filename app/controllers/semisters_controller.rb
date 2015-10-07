class SemistersController < ApplicationController
  before_action :set_semister, only: [:show, :edit, :update, :destroy]

  # GET /semisters
  # GET /semisters.json
  def index
    @semisters = Semister.all
  end

  # GET /semisters/1
  # GET /semisters/1.json
  def show
  end

  # GET /semisters/new
  def new
    @semister = Semister.new
  end

  # GET /semisters/1/edit
  def edit
  end

  # POST /semisters
  # POST /semisters.json
  def create
    @semister = Semister.new(semister_params)

    respond_to do |format|
      if @semister.save
        format.html { redirect_to @semister, notice: 'Semister was successfully created.' }
        format.json { render :show, status: :created, location: @semister }
      else
        format.html { render :new }
        format.json { render json: @semister.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semisters/1
  # PATCH/PUT /semisters/1.json
  def update
    respond_to do |format|
      if @semister.update(semister_params)
        format.html { redirect_to @semister, notice: 'Semister was successfully updated.' }
        format.json { render :show, status: :ok, location: @semister }
      else
        format.html { render :edit }
        format.json { render json: @semister.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semisters/1
  # DELETE /semisters/1.json
  def destroy
    @semister.destroy
    respond_to do |format|
      format.html { redirect_to semisters_url, notice: 'Semister was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def get_university_courses
    @courses = Course.where(:university_id => params[:id].to_i)
     html = "<option>Select Courses</option>"
    @courses.each{|course|
      html << "<option value=#{course.id}>#{course.course_name  }</option>"
    }
      render :html => html.html_safe

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semister
      @semister = Semister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semister_params
      params.require(:semister).permit(:course_id, :semister_name, :year)
    end
end
