require 'simple-gollum-index'

gollum_path = File.expand_path(File.dirname(__FILE__))

GollumIndex.set(:gollum_path, gollum_path)
GollumIndex.set(:wiki_options, {live_preview: false})

run GollumIndex
