require 'rexml/document'
inputfile = ARGV[0]
doc = REXML::Document.new(File.new(inputfile))
layers = doc.elements.each('descendant::g[attribute::inkscape:groupmode="layer"]') { |e| e }
n = layers.size
while n > 0
  filename = inputfile.sub('.svg', '-%03d.svg') % n
  File.open(filename, 'w') do |f|
    puts "Writing #{filename} ..."
    doc.write(f)
    layers.last.remove
    layers.pop
    n = n - 1
  end
end
