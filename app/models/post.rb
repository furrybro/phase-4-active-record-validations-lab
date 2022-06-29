class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :must_have_these_words

  

    def must_have_these_words
        title_array = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

        if title_array.none? { |word| word.match title }
            errors.add(:title, "Must include a clickbait word!")
        end
    end
end
