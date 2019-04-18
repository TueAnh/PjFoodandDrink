class CartsController < ApplicationController
  before_action :load_product, only: %i(create destroy update)
  before_action :current_order, only: :show

  def show
    @order_items = []
    session[:shopping_cart].each do |e|
      @order_items << OrderItem.new(e)
    end
  end

  def create
    order_item = OrderItem.new item_params
    #p Product.find_by(order_item.product_id).price
    result = find_product_in_cart(order_item.product_id)
    if order_item.quantity.nil? || order_item.quantity <= 0
      respond_to do |format|
        format.js
      end
    elsif result
      check_quantity result, order_item.quantity
    else
      session[:shopping_cart] << order_item
      respond_to do |format|
        format.js
      end
    end
    p order_item
    order_item.price =  (Product.find_by id: order_item.product_id).price
  end


  def update
    quantity = params[:quantity].to_i
    if quantity > @product.quantity || quantity <= 0
      flash[:danger] = t ".invalid_quantity"
    else
      result = find_product_in_cart(@product.id)
      result["quantity"] = quantity
    end
    redirect_to cart_path
  end

  def destroy
    session[:shopping_cart].each do |item|
      session[:shopping_cart].delete(item) if item["product_id"] == @product.id
    end
    flash[:success] = t ".success_delete"
    redirect_to cart_path
  end

  private

  def item_params
    params.permit :product_id, :quantity, :price
  end

  def load_product
    current_order
    @product = Product.find_by id: params[:product_id]
    return if @product
    flash[:danger] = t "products.not_found_product"
    redirect_to root_path
  end

  def find_product_in_cart product_id
    result = nil
    session[:shopping_cart].each do |item|
      next unless item["product_id"] == product_id
      result = item
    end
    result
  end

  def check_quantity result, quantity
    if result["quantity"] + quantity > @product.quantity
      flash[:danger] = t ".invalid_quantity"
    else
      result["quantity"] += quantity
    end
  end
end
