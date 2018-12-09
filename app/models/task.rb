class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30}
  validate :validate_name_not_including_conma
  belongs_to :user

  private

  def validate_name_not_including_conma
    errors.add(:name, 'にカンマを含める事はできません') if name&.include?(',')
  end
end
