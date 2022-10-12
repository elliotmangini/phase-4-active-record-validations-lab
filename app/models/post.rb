class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :not_true_facts

    # Custom Validations
    def not_true_facts
        if title == "True Facts"
            errors.add(:title, "Not a valid title")
        end
    end
end
