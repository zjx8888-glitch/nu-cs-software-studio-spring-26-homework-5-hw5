class Todo < ApplicationRecord
    CATEGORIES = ["work", "study", "home chores", "personal"].freeze
  
    validates :category, inclusion: { in: CATEGORIES }, allow_blank: true
  
    scope :with_category, ->(category) {
      if category.present? && CATEGORIES.include?(category)
        where(category: category)
      else
        all
      end
    }
  end