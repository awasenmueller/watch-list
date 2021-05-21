class ListsController < ApplicationController
  # before_action :set_list, only: [:index, :show, :edit, :update]
 
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_list
#       @list = List.find(params[:id])
#     end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:name)
    end
end
