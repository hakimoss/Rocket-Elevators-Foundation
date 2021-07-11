class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  before_action :has_access

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  def has_access
    if current_user
      if current_user.employee
      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: "You need to be an Employee to access in this page" }
        end 
      end
    else
      respond_to do |format|
        format.html { redirect_to (root_path + 'user/sign_in'), notice: "You need to be an Employee to access in this page" }
      end
    end
  end


  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.author = current_user.id

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customerid, :buildingid, :batteryid, :columnid, :elevatorid, :employeeid, :startdate, :enddate, :result, :report, :status)
    end
end
