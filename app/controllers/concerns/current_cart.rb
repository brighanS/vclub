module CurrentCart

  private

  def set_cart
    @cart = Cart.find(current_user.id)
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
   # @cart.id = current_user.id 
  end
end
