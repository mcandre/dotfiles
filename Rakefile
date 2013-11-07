task :lint => [] do
  sh "bundle exec reek -q .; true"
  sh "bundle exec flay ."
  sh "bundle exec flog ."
  sh "bundle exec roodi -config=roodi.yml *.rb **/*.rb"
  sh "bundle exec cane -f *.rb; bundle exec cane -f **/*.rb"
end

task :churn => [] do
  sh "bundle exec churn"
end
