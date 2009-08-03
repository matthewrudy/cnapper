class SnapGeneratorWorker < BackgrounDRb::MetaWorker
  set_worker_name :snap_generator_worker
  def create(args = nil)
    # this method is called, when worker is loaded for the first time
  end

  def generate(snap_id)
    snap = Snap.find(snap_id)
    snap.build_image
    snap.save!
  end

end

