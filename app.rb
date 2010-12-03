require 'sinatra'
require 'quick_magick'

get '/' do
  i = QuickMagick::Image.read('public/oldmona.jpg')
#  i = IO.read('public/ml.bmp').to_s
  
#  erb :output
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
		<%= puts "Data collected is: #{i}" %>
		</td>
	</tr>
</table>
