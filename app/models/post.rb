# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image_url  :string(255)
#  link_url   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :image_url, :link_url, :name
  has_many :comments, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 50 }
  # URI validation is "good enough" but allows some bogus values, e.g., "http://"
  validates :image_url,  presence: true, :format => URI::regexp(%w(http https))
  validates :link_url,  presence: true, :format => URI::regexp(%w(http https))
end
