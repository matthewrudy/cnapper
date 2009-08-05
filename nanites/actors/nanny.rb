ENV["ignore-nanite-mapper"] = "true"
require File.dirname(__FILE__)+"/../../config/environment"
class Nanny < RudeQ::Worker
  include Nanite::Actor
  expose :generate

  def generate(snap_id)
    snap = Snap.find(snap_id)
    snap.build_image
    snap.save!
  end

end

