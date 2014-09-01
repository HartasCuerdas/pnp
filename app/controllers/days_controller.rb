class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy, :toggle_well_registered, :total]

  # GET /days
  # GET /days.json
  def index
    dateToday = Date.today
    @strToday = dateToday.strftime('%b %d, %a')

    dateParam = params[:month] ? Date.parse(params[:month]) : dateToday
    @strCurrentMonth = dateParam.strftime("%B %Y")

    dateBeginningOfMonth = dateParam.beginning_of_month
    dateEndOfMonth = dateParam.end_of_month

    datePrevMonth = dateBeginningOfMonth-1
    dateNextMonth = dateEndOfMonth+1

    @strPrevMonthParam = datePrevMonth.strftime("%Y-%m-01")
    @strNextMonthParam = dateNextMonth.strftime("%Y-%m-01")

    @days = Day.where(date: (dateBeginningOfMonth..dateEndOfMonth)).all.sort_by &:date
  end

  # GET /days/1
  # GET /days/1.json
  def show
  end

  # GET /days/new
  def new
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  # POST /days.json
  def create
    @day = Day.new(day_params)

    @day.well_registered = false

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # TOTAL /days/1
  def total
    #@day = Day.find(params[:id])
    
    oTotal = 0
    dTotal = 0
    @day.ods.each do |od|
      if od.o
        oTotal+=1
      end
      if od.d
        dTotal+=1
      end
    end
    @day.oTotal = oTotal
    @day.dTotal = dTotal

    @day.save
    #render :nothing => true
    respond_to do |format|
      format.js {}
    end
  end

  # TOGGLE_WELL_REGISTERED /days/1
  def toggle_well_registered
    @day.toggle!(:well_registered)
    @day.save
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:date)
    end

end
