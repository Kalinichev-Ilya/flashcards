class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :original_text_and_translated_text_cannot_be_equals

  before_create do
    self.review_date = 3.days.since
  end

  before_validation :strip_whitespace, :only => [:original_text, :translated_text]

  scope :reviewed_between, -> {
    where('review_date <= ?', 3.days.ago)
  }

  private

  def strip_whitespace
    self.original_text = self.original_text.strip.downcase
    self.translated_text = self.translated_text.strip.downcase
  end

  def original_text_and_translated_text_cannot_be_equals
    if original_text == translated_text
      errors.add(:card, 'Original text and translated text can\'t be equals.')
    end
  end
end
