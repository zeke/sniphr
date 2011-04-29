# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Sniphr::Application.load_tasks

task :preso => :environment do  
  system "sass ~/.slideshow/templates/helvetica/ui/default/pretty.sass ~/.slideshow/templates/helvetica/ui/default/pretty.css"
  system "slideshow -o ~/Projects/wordnik/sniphr/doc/slides -t helvetica.txt ~/Projects/wordnik/sniphr/doc/preso.md"
  system "open ~/Projects/wordnik/sniphr/doc/slides/preso.html"
end

task :top_query_domains => :environment do
  domains = Query.all.map(&:q).compact.select {|q| q.valid_url?}.map(&:domain)
  groups = domains.group_by(&:downcase).map {|k,v| [k, v.length]}
  groups = groups.sort{|x,y| x.last <=> y.last}.reverse

  longest_domain_length = domains.sort{|x,y| x.size <=> y.size}.last.size

  groups.each do |g|
    puts [
      g.first.to_s,
      ' ' * (longest_domain_length+3-g.first.length),
      g.last.to_s
    ].join("")
  end

end