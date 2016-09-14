class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      current_user.account_id = @account.id
      current_user.save
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  private
  def account_params
    params.require(:account).permit(:first_name, :last_name)
  end
end
