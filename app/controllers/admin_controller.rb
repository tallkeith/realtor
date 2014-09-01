class AdminController < ApplicationController
  http_basic_authenticate_with name: "jess", password: "jess"
end
