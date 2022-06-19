class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(current_customer.id)
      flash[:notice] = '会員情報編集が成功しました'
    else
      render :edit
      flash[:alert] = '会員情報編集が失敗しました'
    end
  end
  # 退会確認ページ
  def quit
  end
  # 退会アクション
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.is_deleted = true
    @customer.save!
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
end
