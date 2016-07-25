LoanAlteration.create!([
  {loan_offer_id: 1},
  {loan_offer_id: 1},
  {loan_offer_id: 1},
  {loan_offer_id: 1}
])
LoanOffer.create!([
  {user_id: 1, term: "9 months", usage: "Personal", amount: "80000.0"}
])
Notification.create!([
  {message: 1, user: "clonaldo@gmail.com"}
])
User.create!([
  {email: "clonaldo@gmail.com", password_digest: "$2a$10$9bloNFAg9h4JhdRB3vdxwu4xJC7PTMnkHQyJniG7jCuc5j0jr7y5e", auth_token: "rNl2SxuqhwflwXFj2PEHMQ", password_reset_token: nil, password_reset_sent_at: nil}
])
