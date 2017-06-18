class PortfoliosController < ApplicationController
    
    def index
      @portfolio_items = Portfolio.all
    end
    
    def new
      @portfolio_item = Portfolio.new
    end
    
    def show
    end
end
