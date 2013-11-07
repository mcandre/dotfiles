task :reek => [] do
  sh "bundle exec reek -q .; true"
end

task :flay => [] do
  sh "bundle exec flay ."
end

task :roodi => [] do
  sh "bundle exec roodi -config=roodi.yml *.rb **/*.rb"
end

task :cane => [] do
  sh "bundle exec cane -f *.rb; bundle exec cane **/*.rb"
end

task :lint => [:reek, :flay, :roodi] do
end
