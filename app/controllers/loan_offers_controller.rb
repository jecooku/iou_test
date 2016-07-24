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
    old_amount = @loan_offer.amount
    if @loan_offer.update_attributes(loan_offer_params)
      new_amount = @loan_offer.amount
      if new_amount != old_amount
        @loan_offer.loan_alterations.create
        if @loan_offer.loan_alterations.where('loan_alterations.created_at >= ?', 1.week.ago).count > 3
          Notification.create(:user => current_user.email, :message => :loan_amount)
        end
      end
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
