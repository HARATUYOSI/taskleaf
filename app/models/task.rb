class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30}
  validate :validate_name_not_including_conma
  belongs_to :user
  has_one_attached :image
  scope :recent, -> {order(created_at: :desc)}

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  private

  def validate_name_not_including_conma
    errors.add(:name, 'にカンマを含める事はできません') if name&.include?(',')
  end
end
