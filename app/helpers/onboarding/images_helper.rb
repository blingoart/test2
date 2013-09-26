module Onboarding::ImagesHelper

  def show_files(file, path, size)
    if size == 'full'
      @size = ''
    elsif size == 'small'
      @size = '200'
    else
      @size = '200'
    end
    @class = "onboarding-image"
    @extension = File.extname(file.file_name.to_s).sub(/\./, '')
    if @extension == 'jpg' || @extension == 'jpeg'  || @extension == 'png' || @extension == 'gif'
      link_to image_tag(file.file_name, :height => @size, :class => @class), path
    elsif @extension == 'pdf' || @extension == 'psd' || @extension == 'ai' || @extension == 'eps'
      link_to image_tag("/file_icons/#{@extension}.png", :height => @size), path
    else
      link_to image_tag("/file_icons/default.png", :height => @size), path
    end
  end

end
