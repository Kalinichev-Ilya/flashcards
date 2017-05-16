class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :original_text_and_translated_text_cannot_be_equals

  before_create do
    self.review_date = Time.now + (3 * 24 * 60 * 60)

  end

  before_validation :strip_whitespace, :only => [:original_text, :translated_text]

  private

  def strip_whitespace
    self.original_text = self.original_text.strip
    self.translated_text = self.translated_text.strip
  end

  def original_text_and_translated_text_cannot_be_equals
    if original_text == translated_text
      errors.add(:card, 'Original text and translated text can\'t be equals.')
    end
  end
end
