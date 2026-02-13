class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  @job = Job.find(params[:id])

  if current_user.client?
    # Client → sab proposals dekhe
    @proposals = @job.proposals.includes(:freelancer)
  else
    # Freelancer → sirf apna proposal dekhe
    @proposals = @job.proposals.where(freelancer_id: current_user.id)
  end
end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = current_user.jobs.build(job_params)
    process_skills_array

  if @job.save
    redirect_to @job, notice: "Job posted successfully."
  else
    render :new, status: :unprocessable_entity
  end
end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    process_skills_array
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy!

    respond_to do |format|
      format.html { redirect_to jobs_path, notice: "Job was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.expect(job: [ :title, :description, :budget, :project_type, :experience_level, :deadline, :skills, :user_id ])
    end
     def process_skills_array
    if params[:job][:skills].is_a?(String)
      # Convert "Ruby, JavaScript, CSS" to ["Ruby", "JavaScript", "CSS"]
      @job.skills = params[:job][:skills]
                          .split(",")
                          .map(&:strip)
                          .reject(&:blank?)
    end
  end
end
