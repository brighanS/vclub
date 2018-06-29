module CurrentCart

  private

  def set_cart
    @cart = Cart.find(current_user.id)
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
   current_user.id = @cart.id
  end
end
