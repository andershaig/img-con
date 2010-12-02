require 'sinatra'
require 'quick_magick'

configure do
  environment = Sinatra::Application.environment.to_s
end

class Accio
  def self.english_to_pig_latin(text)
    text.split.map do |word|
      if word.length <= 2
        word
      else
        (word[1,9999] + word[0,1] + "ay").downcase
      end
    end.join(" ")
  end
end

get '/' do
  i = QuickMagick::Image.read('oldmona.jpg').first
  i.resize "300x300!"
  i.save "newmona.jpg"
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
