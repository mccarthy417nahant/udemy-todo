class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to Root_path, notice: 'Item was successfully created.'}
        format.json {render :show, status: :created, location: @item}
      else
        format.html {render :new}
        format.json {render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html {redirect_to items_url, notice: 'Item was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:tem)
  end
end
