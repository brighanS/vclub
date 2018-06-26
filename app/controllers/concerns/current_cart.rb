module CurrentCart

  private

  def set_cart
    @cart = Cart.find(current_user.id)
    #@cart = Cart.find_by cart_id: current_user
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
   current_user.id = @cart.id
  end
end
