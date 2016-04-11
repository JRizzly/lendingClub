class InputformsController < ApplicationController
  before_action :set_inputform, only: [:show, :edit, :update, :destroy]

  # GET /inputforms
  # GET /inputforms.json
  def index
    @inputforms = Inputform.all
  end

  # GET /inputforms/1
  # GET /inputforms/1.json
  def show
  end

  # GET /inputforms/new
  def new
    @inputform = Inputform.new
  end

  # GET /inputforms/1/edit
  def edit
  end

  # POST /inputforms
  # POST /inputforms.json
  def create
    @inputform = Inputform.new(inputform_params)

    respond_to do |format|
      if @inputform.save
        format.html { redirect_to @inputform, notice: 'Inputform was successfully created.' }
        format.json { render :show, status: :created, location: @inputform }
      else
        format.html { render :new }
        format.json { render json: @inputform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inputforms/1
  # PATCH/PUT /inputforms/1.json
  def update
    respond_to do |format|
      if @inputform.update(inputform_params)
        format.html { redirect_to @inputform, notice: 'Inputform was successfully updated.' }
        format.json { render :show, status: :ok, location: @inputform }
      else
        format.html { render :edit }
        format.json { render json: @inputform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inputforms/1
  # DELETE /inputforms/1.json
  def destroy
    @inputform.destroy
    respond_to do |format|
      format.html { redirect_to inputforms_url, notice: 'Inputform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inputform
      @inputform = Inputform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inputform_params
      params.require(:inputform).permit(:loan_amnt, :installment, :grade, :emp_length, :annual_inc, :dti, :fico_range_low, :fico_range_high, :number_inq_last_6months)
    end
end
