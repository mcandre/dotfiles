task :lint => [] do
  sh "bundle exec reek -q .; true"
  sh "bundle exec flay ."
  sh "bundle exec flog ."
  sh "bundle exec roodi -config=roodi.yml *.rb **/*.rb"
end
