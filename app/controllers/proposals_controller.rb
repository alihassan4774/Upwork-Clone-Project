class ProposalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job

  # GET /proposals or /proposals.json
  def index
   @proposal = @job.proposals.build
  end

  # GET /proposals/1 or /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals or /proposals.json
  def create
    @proposal = @job.proposals.build(proposal_params)
    @proposal.freelancer = current_user

    if @proposal.save
      redirect_to @job, notice: "Proposal sent successfully."
    else
      render :new
    end
  end

  # PATCH/PUT /proposals/1 or /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: "Proposal was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1 or /proposals/1.json
  def destroy
    @proposal.destroy!

    respond_to do |format|
      format.html { redirect_to proposals_path, notice: "Proposal was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
   def set_job
    @job = Job.find(params[:job_id])
   end

    # Only allow a list of trusted parameters through.
    def proposal_params
      params.require(:proposal).permit(:cover_letter, :bid_amount, :estimated_time)
    end
end
