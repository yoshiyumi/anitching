class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end


  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
     render :edit
    end
  end

  def customer_params
    params.require(:customer).permit(:nicname,:email,:gender,:prefectures,:image,:introduction,:is_active)
  end
end
