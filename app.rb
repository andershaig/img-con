require 'rubygems'
require 'sinatra'
require 'RMagick'
include Magick

class CrazyCSS
  def initialize
    @i = nil
  end
end

get '/' do
  $pixels = []
  @i = Image.read('public/oldmona.jpg').first
  @i.each_pixel do |pixel, c, r|
	  $pixels.push(pixel.to_color(compliance=AllCompliance, matte=false, depth=QuantumDepth, hex=true))
	end
#  @i = QuickMagick::Image.read('public/oldmona.jpg').first
#  i.resize "300x300!"
#  i.save "newmona.jpg"
  
  erb :output
end

__END__

@@ output

<div style="height:68px;width:159px;">
<%= $pixels.map {|i| "<span style='background-color:#{i};'></span>" } %>
</div>
