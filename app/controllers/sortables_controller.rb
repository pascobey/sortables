class SortablesController < ApplicationController
  before_action :set_sortable, only: [:show, :edit, :update, :destroy, :move]

  # GET /sortables
  # GET /sortables.json
  def index
    @sortables = Sortable.all
  end

  # GET /sortables/1
  # GET /sortables/1.json
  def show
  end

  # GET /sortables/new
  def new
    @sortable = Sortable.new
  end

  # GET /sortables/1/edit
  def edit
  end

  # POST /sortables
  # POST /sortables.json
  def create
    @sortable = Sortable.new(sortable_params)

    respond_to do |format|
      if @sortable.save
        format.html { redirect_to @sortable, notice: 'Sortable was successfully created.' }
        format.json { render :show, status: :created, location: @sortable }
      else
        format.html { render :new }
        format.json { render json: @sortable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sortables/1
  # PATCH/PUT /sortables/1.json
  def update
    respond_to do |format|
      if @sortable.update(sortable_params)
        format.html { redirect_to @sortable, notice: 'Sortable was successfully updated.' }
        format.json { render :show, status: :ok, location: @sortable }
      else
        format.html { render :edit }
        format.json { render json: @sortable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sortables/1
  # DELETE /sortables/1.json
  def destroy
    @sortable.destroy
    respond_to do |format|
      format.html { redirect_to sortables_url, notice: 'Sortable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move 
    @sortable.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sortable
      @sortable = Sortable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sortable_params
      params.require(:sortable).permit(:position)
    end
end
