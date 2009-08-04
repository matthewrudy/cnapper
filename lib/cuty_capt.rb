require 'tempfile'
module CutyCapt
  def generate(url)
    path = get_tmp_path
    `CutyCapt --url=#{url} --out=#{path}`
    return path
  end

  protected

  def get_tmp_path(extension=:jpg)
    Tempfile.open("cutycapt") do |file|
      return "#{file.path}.#{extension}"
    end
  end
    
  extend self
end

