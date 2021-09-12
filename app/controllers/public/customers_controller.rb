class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
  end
  
  def mypage
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
      render :edit
    else
      redirect_to customers_my_page_path
    end

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
     render :edit
    end

  end

  def history
    @customer = current_customer
  end
  
  def confirm
    @customer = current_customer
  end

  def withdraw
   @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nicname,:image,:gender,:email,:prefectures,:introduction,:is_active)
  end
end

