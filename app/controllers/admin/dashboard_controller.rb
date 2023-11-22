class Admin::DashboardController < Admin::AdminController
  def show
    @products = Product.all
    @categories = Category.all
  end
end
