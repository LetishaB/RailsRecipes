class Recipe < ApplicationRecord
  searchable do
      text :title, :description
      text :ingredients do
        ingredients.map { |ingredient| ingredient.name }
      end
      time :created_at
  end

  belongs_to :user
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true
  validates :title, :description, presence:true
  has_attached_file :image, styles: { medium: '400x400#' }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
end
