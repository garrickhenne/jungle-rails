module ProductHelper
  def sold_out? (product)
    product.quantity <= 0
  end

  def img?(url)
    url || 'https://i.pinimg.com/originals/2a/b1/3a/2ab13a4cebbf0cb6dd2cd5aa7e59abee.png'
  end
end
