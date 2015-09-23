module ImageHelper
 def image_path(path)
   "#{Rails.application.config.x.cdn_url}/images/#{path}"
 end
end
