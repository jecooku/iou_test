class LoanOffersController < ApplicationController

  def new
    @loan_offer = LoanOffer.new
  end

  def create
    @loan_offer = current_user.loan_offers.new(loan_offer_params)
    if @loan_offer.save
      flash[:notice] = 'Loan offer successfully created'
      redirect_to root_url
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def edit
    @loan_offer = LoanOffer.find_by_user_id(params[:id])
  end

  def update
    @loan_offer = LoanOffer.find_by_user_id(params[:id])
    if @loan_offer.update_attributes(loan_offer_params)
      flash[:notice] = 'Loan offer successfully updated'
      redirect_to root_url
    else
      flash[:alert] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def loan_offer_params
    params.require(:loan_offer).permit(:amount, :usage, :term, :user_id)
  end

end
