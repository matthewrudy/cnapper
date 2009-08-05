class Snap < ActiveRecord::Base
  has_attached_file :image,
    :styles => { :thumb => "240x720", :large => "660x1980" },
    :default_url   => "/images/missing.jpg"

  #before_create :build_image

  #def start_generation
  #  MiddleMan.worker(:snap_generator_worker).async_generate(:arg => self.id)
  #end

  def start_generation
    Nanite.request("/nanny/generate", self.id)
  end

  def build_image
    path = CutyCapt.generate(self.url)
    self.image = File.open(path)
  end
end
