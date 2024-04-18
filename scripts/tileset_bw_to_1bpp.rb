require 'rmagick'
include Magick

BYTE_SIZE = 8.freeze

img = ImageList.new("../Images/tileset-bw.png")

cursor_x = 0

pixel_1bpp = ''

while cursor_x < img.columns do

  pixels = img.get_pixels(cursor_x, 0, BYTE_SIZE, BYTE_SIZE)
  pixel_1bpp += pixels.map { |pixel| pixel.hash > 128 ? 0.to_s : 1.to_s }.join('')

  cursor_x += BYTE_SIZE
end

File.binwrite('1bpp.bin', [pixel_1bpp].pack("B*"))
