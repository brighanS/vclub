module CurrentCart

  private

  def set_cart
    @cart = Cart.find(current_user.id)
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    @cart.usrid = current_user.id
  end

  def set_user
    @user = current_user.id
  end
end
