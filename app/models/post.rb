class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, :content, :author, presence: true
  validates :title, uniqueness:{scope: :author}, length:{maximum: 100}
end
