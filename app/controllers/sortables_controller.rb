class SortablesController < ApplicationController
  before_action :set_sortable, only: [:move]

  # GET /sortables
  # GET /sortables.json
  def index
    @sortable = Sortable.new
    @sortables = Sortable.all
    @column = Column.new
    @columns = Column.all
  end

  # POST /sortables
  # POST /sortables.json
  def create
    @sortable = Sortable.new(sortable_params)

    # respond_to do |format|
    if @sortable.save
      redirect_to sortables_path, notice: "New #{@sortable.column} item created"
    else
      redirect_to sortables_path, notice: "#{@sortable.column} item failed to create"
    end
    # end
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
    # @sortable.update_attributes(sortable_params)
    @sortable.insert_at(params[:position].to_i)
    # redirect_to('/')
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sortable
      @sortable = Sortable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sortable_params
      params.require(:sortable).permit(:position, :column)
    end
end
