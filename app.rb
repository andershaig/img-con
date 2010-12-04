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
	  $pixels.push(pixel.to_color(compliance=AllCompliance, matte=false, depth=QuantumDepth, hex=false))
	end
#  @i = QuickMagick::Image.read('public/oldmona.jpg').first
#  i.resize "300x300!"
#  i.save "newmona.jpg"
  
  erb :output
end

__END__

@@ output

<h1>Mona Lisa in CSS</h1>
<hr/>
<table>
	<tr>
		<td>
		<h2>Original</h2>
		<img src="oldmona.jpg" alt="Original Image Not Found" />
		</td>
		<td>
		<h2>Converted</h2>
		<div style="height:128px;width:128px;">
		<%= $pixels.map {|i| "<span style='height:1px;width:1px;background-color:#{i};display:inline-block'></span>" } %>
		</div>
		</td>
	</tr>
</table>
