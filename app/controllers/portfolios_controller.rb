class PortfoliosController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
    helper_method :technology
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all
    
    def index
      @portfolio_items = Portfolio.recent.includes(:technologies, :user)
      @technologies = Technology.all
    end
    
    def new
      @portfolio_item = current_user.portfolios.build
    end
    
    def create
      @portfolio_item = current_user.portfolios.build(portfolio_params)
  
      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'New Portfolio Item was successfully added.' }
        else
          format.html { render :new }
        end
      end
    end
    
    def edit
    end
    
    def update
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.'}
        else
          format.html { render :edit }
        end
      end
    end
    
    def destroy
      @portfolio_item.destroy
      @portfolio_items = Portfolio.includes(:technologies, :user)
      respond_to do |format|
        format.js
      end
    end
    
    def show
    end
    
    def technology(portfolio_item)
      @technologies = []
      @technologies_array = portfolio_item.technologies
      @technologies_array.each do |tech|
        @technologies.push(tech.name)
      end
      @technologies =  @technologies.split().join(", ")
    end
    
    
    private
      def set_portfolio
        @portfolio_item = Portfolio.find(params[:id])
      end
      
      def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:id, :name, :_destroy])
      end
end
