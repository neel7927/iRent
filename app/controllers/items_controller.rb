class ItemsController < ApplicationController
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
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
