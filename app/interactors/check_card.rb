class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.user_input
      card.review_date = Time.now
      card.save
    else
      context.fail!
    end
  end
end
