require 'rails_helper'
require "./app/helpers/image_helper"

class ImageHelperWrapper
  include ImageHelper
end

RSpec.describe ImageHelper do
  subject(:image_helper) { ImageHelperWrapper.new }

  let(:cdn_url) do
    Rails.application.config.x.cdn_url
  end

  it "adds a link to the image CDN to paths" do
    expect(image_helper.image_path("test")).to eq("#{cdn_url}/images/test")
  end
end
