class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  validates :title, :description, :category, 
            :picture, :finish_date, presence: true

  validates :price, numericality: { greater_than: 0 }

  has_attached_file :picture, styles: { large: "800x300", medium: "350x180#", thumb: "100x100>" }, default_url: "/images/:styles /missing.pnh"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Scopes
  scope :descending_order, ->(quantity = 9) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member: member) }

  # Gem rails-Money
  monetize :price_cents
end
