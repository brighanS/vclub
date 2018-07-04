module CurrentCart

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
    # if @cart = Cart.find(current_user.id)
    #
    # else
    #   @cart = Cart.create
    #   @cart.usrid = current_user.id
    # end
  end

  def set_user
    @user = current_user.id
  end
end
