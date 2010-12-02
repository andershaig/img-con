require 'sinatra'
require 'quick_magick'

get '/' do
#  i = QuickMagick::Image.read('oldmona.jpg').first
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
		<img src="newmona.jpg" alt="Converted Image Not Found" />
		</td>
	</tr>
</table>
