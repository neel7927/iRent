class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    if params[:category]
      @items = Item.where(category: params[:category])
      if @items.empty?
        flash[:error] = "There are <b>#{@items.count}</b> in this category".html_safe
      else
        flash[:notice] = "There are <b>${@items.count}</b> in this category".html_safe
      end
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item =  Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category, :item_condition, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
