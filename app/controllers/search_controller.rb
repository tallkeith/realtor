class SearchController < ApplicationController
  def results
    @property = Rubillow::HomeValuation.search_results({ :address => session[:address], :citystatezip => session[:citystatezip] })
  end
end
