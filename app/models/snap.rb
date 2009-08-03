class Snap < ActiveRecord::Base
  has_attached_file :image,
    :styles => { :thumb => "240x720" },
    :default_url   => "/images/missing.jpg"

  before_create :build_image

  def build_image
    path = CutyCapt.generate(self.url)
    self.image = File.open(path)
  end
end
