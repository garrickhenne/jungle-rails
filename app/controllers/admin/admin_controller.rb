class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USERNAME'), password: ENV.fetch('ADMIN_PASSWORD')
end