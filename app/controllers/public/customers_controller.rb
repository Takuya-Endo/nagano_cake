class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to '/customers/:current_customer'
  end

  def update_unsubscribe
    customer = Customer.find(current_customer.id)
    customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def unsubscribe_confirm
    @customer = Customer.find(current_customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
