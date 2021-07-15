class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  before_action :has_access

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  def has_access
    if current_user
      if current_user.employee || current_user.is_admin
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

    if current_user.employee
      @intervention.author_id = Employee.where(user_id: current_user.id)[0].id
    end

    @intervention.result = 'Incomplete'
    @intervention.status = 'Pending'
    @intervention.start_date = 'null'
    @intervention.end_date = 'null'
    @intervention.employee_id
    @intervention.valid?
  

    @intervention.save
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

  # def get_buildings_for_customer
  #   puts "get_buildings_for_customer"
  #   puts params
  #   # @buildings = Customer.find(params[:])
  #   @buildings = Building.where("customer_id = ?", params[:customerid])
  #   puts "here are the buildings:"
  #   puts @buildings
  #   respond_to do |format|
  #   format.json { render :json => @buildings }
  #   end
  # end

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

  def get_buildings_for_customer
    puts "get_buildings_for_customer"
    puts params
    @buildings = Building.where("customer_id = ?", params[:customer_id])
    puts "here are the buildings:"
    puts @buildings
    respond_to do |format|
    format.json { render :json => @buildings }
    end
  end

  def get_batteries_for_building
    puts "get_batteries_for_building"
    puts params
    @batteries = Battery.where("building_id = ?", params[:building_id])
    puts "here are the batteries:"
    puts @batteries
    respond_to do |format|
    format.json { render :json => @batteries }
    end
  end

  def get_columns_for_battery
    puts "get_columns_for_battery"
    puts params
    @columns = Column.where("battery_id = ?", params[:battery_id])
    respond_to do |format|
    format.json { render :json => @columns }
    end
  end

  def get_elevators_for_column
    puts "get_elevators_for_column"
    puts params
    @elevators = Elevator.where("column_id = ?", params[:column_id])
    respond_to do |format|
    format.json { render :json => @elevators }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end
end
