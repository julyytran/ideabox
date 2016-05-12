class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :quality, presence: true

  def self.descending
    all.order(created_at: :desc)
  end
end
