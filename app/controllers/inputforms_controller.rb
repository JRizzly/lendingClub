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
    @tempinput = Inputform.find(params[:id])
    @temploan = Loan.where("loan_amnt > ?", 500).limit(20000)
    
    
    @listOfVectors = []
    @listOfIndex = []
    for loan in @temploan do
        newVector = [loan.loan_amnt.to_f,loan.installment.to_f, loan.annual_inc.to_f, loan.dti.to_f, loan.fico_range_low.to_f, loan.fico_range_high.to_f, loan.inq_last_6mths.to_f]
        @listOfVectors.push(newVector)
        @listOfIndex.push(loan.id)
    end 

    #We also need to change this to add both Euclidian distance and Cosine sim in display
    @inputVector = [ @tempinput.loan_amnt.to_f, @tempinput.installment.to_f, @tempinput.annual_inc.to_f, @tempinput.dti.to_f, @tempinput.fico_range_low.to_f, @tempinput.fico_range_high.to_f, @tempinput.number_inq_last_6months.to_f]
    knn = KNN.new(@listOfVectors, :distance_measure => :cosine_similarity)
    @nearestNeighborsCos = knn.nearest_neighbours( @inputVector, @tempinput.k.to_i)
    
    #@listOfVectorsCopy = Marshal.load( Marshal.dump(@listOfVectors) )
    knn2 = KNN.new(@listOfVectors, :distance_measure => :euclidean_distance)
    @nearestNeighborsEuc = knn2.nearest_neighbours( @inputVector, @tempinput.k.to_i)
    

    
    @paidStatusVec = []
    @numFullyPaid = 0.00
    @similarPeople = []
    @similarityScore = []
    @temp = 0
    
    for vec in @nearestNeighborsCos do
      temp = (Loan.find( @listOfIndex[vec.first] ))
      @similarityScore.push(vec.second)
      @similarPeople.push(temp)
      stringData = temp.loan_status.to_s
      if stringData.include? "Fully Paid"
        @paidStatusVec.push(1)
        @numFullyPaid = @numFullyPaid + 1.00
      else
        @paidStatusVec.push(0)
      end
    end 
    
    
    
    @paidStatusVec2 = []
    @numFullyPaid2 = 0.00
    @similarPeople2 = []
    @similarityScore2 = []
    @temp2 = 0

    
    for vec in @nearestNeighborsEuc do
      temp = (Loan.find( @listOfIndex[vec.first] ))
      @similarityScore2.push(vec.second)
      @similarPeople2.push(temp)
      stringData = temp.loan_status.to_s
      if stringData.include? "Fully Paid"
        @paidStatusVec2.push(1)
        @numFullyPaid2 = @numFullyPaid2 + 1.00
      else
        @paidStatusVec2.push(0)
      end
    end 
    
    
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
      params.require(:inputform).permit(:loan_amnt, :installment, :grade, :emp_length, :annual_inc, :dti, :fico_range_low, :fico_range_high, :number_inq_last_6months, :k)
    end
end
