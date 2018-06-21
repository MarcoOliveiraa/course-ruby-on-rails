class Ad < ApplicationRecord
  # Constante
  QTD_PAGE = 6

  before_save :md_to_html

  belongs_to :category, counter_cache: true
  belongs_to :member
  has_many :comments

  validates :title, :description_md, :description_short, :category, 
            :picture, :finish_date, presence: true

  validates :price, numericality: { greater_than: 0 }

  has_attached_file :picture, styles: { large: "800x300", medium: "350x180#", thumb: "100x100>" }, default_url: "/images/:styles /missing.pnh"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Scopes
  scope :descending_order, ->(page) { 
    order(created_at: :desc).page(page).per(QTD_PAGE) 
  }
  scope :search, ->(q, page = 1) { 
    where("title LIKE ?", "%#{q}%").page(page).per(QTD_PAGE) 
  }
  scope :to_the, ->(member) { where(member: member) }
  scope :where_category, ->(category) { where(category: category) }
  

  # Gem rails-Money
  monetize :price_cents


  private

    def md_to_html 

      options = {
          filter_html: true,
          link_attributes: {
            rel: "nofollow",
            target: "_blank"
          }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      self.description = markdown.render(self.description_md).html_safe       
    end

end
