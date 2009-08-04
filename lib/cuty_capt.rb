require 'tempfile'
module CutyCapt
  def generate(url)
    path = get_tmp_path

    shell_command "CutyCapt --url=#{url} --out=#{path}"
    
    return path
  end

  protected

  def get_tmp_path(extension=:jpg)
    Tempfile.open("cutycapt") do |file|
      return "#{file.path}.#{extension}"
    end
  end

  def shell_command(command)
    Rails.logger.info(command)
    `#{command}`
  end

  extend self
end

