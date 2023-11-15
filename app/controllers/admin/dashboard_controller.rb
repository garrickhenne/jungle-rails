class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USERNAME'), password: ENV.fetch('ADMIN_PASSWORD')
  
  def show
    @products = Product.all
    @categories = Category.all
  end
end
