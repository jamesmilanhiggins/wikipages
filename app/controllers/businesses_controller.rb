class BusinessesController < ApplicationController

  def new
    @type = Type.find(params[:type_id])
    @business = @type.businesses.new
  end

  def create
    @type = Type.find(params[:type_id])
    @business = @type.businesses.new(business_params)
    if @business.save
      redirect_to type_path(@business.type)
    else
      render :new
    end
  end

  def edit
    @type = Type.find(params[:type_id])
    @business = Business.find(params[:id])
  end

  def update
    @type = Type.find(params[:type_id])
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to type_path(@business.type)
    else
      render :edit
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to type_path(@business.type)
  end

private
  def business_params
    params.require(:business).permit(:name)
  end
end
