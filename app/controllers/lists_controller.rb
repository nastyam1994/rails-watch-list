class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  #GET lists/:id
  def show
  end

  #GET lists/new
  def new
    @list = List.new
  end

  #POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice:  "List was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_url, notice: "List was successfuly destroyed"
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
