# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'open-uri'

begin
  require 'rspec/core/rake_task'
  desc "Run all examples"
  RSpec::Core::RakeTask.new('spec')
  task :default => :spec
rescue LoadError
end

include Rake::DSL

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

task :tag_sniphs => :environment do

  #  Find sniphs for which no tagging has been attempted
  Sniph.where(:last_tagging_attempted_at => nil).limit(200).each do |sniph|

    tags = Delicious.get_tags_for_url(URI.encode(sniph.url))
    
    # Timestamp the sniph with the tagging attempt, even if no tags were found
    sniph.blatantly_update_tags! tags.join(", ")
  
    if tags.present?
      puts tags.join(", ")
    else
      puts "---- no tags for #{sniph.url}"
    end

    # Don't get banned..
    sleep(2)

  end

end