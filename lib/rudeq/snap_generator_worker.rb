class Rudeq::SnapGeneratorWorker < RudeQ::Worker
  def queue_name
    :rudeness
  end

  def do_work(data)
    generate(data)
  end

  def generate(snap_id)
    snap = Snap.find(snap_id)
    snap.build_image
    snap.save!
  end

end

