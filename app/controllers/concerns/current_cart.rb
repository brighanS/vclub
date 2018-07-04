module CurrentCart

  private

  def set_cart
    @cart = Cart.find(current_user.id)
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    # session[:cart_id] = @cart.id
    @cart.user_id = current_user.id
  end

  def set_user
    @user = current_user.id
  end
end
