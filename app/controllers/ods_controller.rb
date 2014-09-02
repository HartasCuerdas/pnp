class OdsController < ApplicationController
  before_action :set_od, only: [:show, :edit, :update, :destroy, :toggle_o, :toggle_d]

  # GET /ods
  # GET /ods.json
  def index
    dayParam = params[:day_id] ? params[:day_id] : false
    if !dayParam
      @ods = Od.all
    else
      @ods = Od.where(day_id: dayParam)
    end
  end

  # GET /odtoggle
  def toggle
  #  @ods = Od.all
    @ods = Od.where('instant BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
    if (@ods.nil? || @ods.empty?)
      Od.create(
        [
          { :instant => DateTime.now, :timekey => '06:00' },
          { :instant => DateTime.now, :timekey => '06:30' },
          { :instant => DateTime.now, :timekey => '23:30' }
        ]
      )
    end
  end

  # GET /ods/1
  # GET /ods/1.json
  def show
  end

  # GET /ods/new
  def new
    @od = Od.new
  end

  # GET /ods/new_no_timekey
  def new_no_timekey
    @od = Od.new
  end

  # GET /ods/1/edit
  def edit
  end

  # POST /ods
  # POST /ods.json
  def create
    @od = Od.new(od_params)

    respond_to do |format|
      if @od.save
        format.html { redirect_to @od, notice: 'Od was successfully created.' }
        format.json { render :show, status: :created, location: @od }
      else
        format.html { render :new }
        format.json { render json: @od.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ods/1
  # PATCH/PUT /ods/1.json
  def update
    respond_to do |format|
      if @od.update(od_params)
        format.html { redirect_to @od, notice: 'Od was successfully updated.' }
        format.json { render :show, status: :ok, location: @od }
      else
        format.html { render :edit }
        format.json { render json: @od.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ods/1
  # DELETE /ods/1.json
  def destroy
    @od.destroy
    respond_to do |format|
      format.html { redirect_to ods_url, notice: 'Od was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # TOGGLE_O /ods/1
  def toggle_o
    @od.toggle_o
    render :nothing => true
  end

  # TOGGLE_D /ods/1
  def toggle_d
    @od.toggle_d
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_od
      @od = Od.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def od_params
      params.require(:od).permit(:instant, :o, :d, :timekey)
    end

end
