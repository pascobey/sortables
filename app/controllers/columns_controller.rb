class ColumnsController < ApplicationController

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to sortables_path
    else
      redirect_to sortables_path
    end
  end

  def delete
  end

  private
    def column_params
      params.require(:column).permit(:name)
    end
end
