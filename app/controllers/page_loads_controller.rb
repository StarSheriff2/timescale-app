class PageLoadsController < ApplicationController
  before_action :set_page_load, only: %i[ show edit update destroy ]

  # GET /page_loads or /page_loads.json
  def index
    @page_loads = PageLoad.all
  end

  # GET /page_loads/1 or /page_loads/1.json
  def show
  end

  # GET /page_loads/new
  def new
    @page_load = PageLoad.new
  end

  # GET /page_loads/1/edit
  def edit
  end

  # POST /page_loads or /page_loads.json
  def create
    @page_load = PageLoad.new(page_load_params)

    respond_to do |format|
      if @page_load.save
        format.html { redirect_to page_load_url(@page_load), notice: "Page load was successfully created." }
        format.json { render :show, status: :created, location: @page_load }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_loads/1 or /page_loads/1.json
  def update
    respond_to do |format|
      if @page_load.update(page_load_params)
        format.html { redirect_to page_load_url(@page_load), notice: "Page load was successfully updated." }
        format.json { render :show, status: :ok, location: @page_load }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_loads/1 or /page_loads/1.json
  def destroy
    @page_load.destroy

    respond_to do |format|
      format.html { redirect_to page_loads_url, notice: "Page load was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_load
      @page_load = PageLoad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_load_params
      params.require(:page_load).permit(:user_agent)
    end
end
