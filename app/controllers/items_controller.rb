class ItemsController < ApplicationController
  before_action :set_dep
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = @dep.items
  end

  def show
  end

  def new
    @item = @dep.items.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end
  def create
    @item = @dep.items.new(item_params)
    if @item.save
    redirect_to department_item_path(@dep, @item)
    else
    render partial: "form"
    end

    def update
      if @item.update(item_params)
        redirect_to department_item_path(@dep, @item)
      else
        render partial: "form"
      end
    end

    def destroy
      @item.destroy
      redirect_to department_item_path(@dep)
    end


  end
  private

  def set_dep
    @dep = Department.find(params[:department_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:name, :price, :instock)
  end
end
