task :ruby => [] do
  begin
    sh 'for f in *.rb; do ruby -wc $f | grep -v "Syntax OK"; done'
  rescue
  end
  begin
    sh 'for f in **/*.rb; do ruby -wc $f | grep -v "Syntax OK"; done'
  rescue
  end
end

task :reek => [] do
  sh 'bundle exec reek -q .; true'
end

task :flay => [] do
  sh 'bundle exec flay .'
end

task :roodi => [] do
  sh 'bundle exec roodi -config=roodi.yml *.rb **/*.rb'
end

task :cane => [] do
  sh 'bundle exec cane -f *.rb; bundle exec cane **/*.rb'
end

task :excellent => [] do
  sh 'bundle exec excellent .'
end

task :rubocop => [] do
  sh 'bundle exec rubocop **/*.rb **/*.erb **/Guardfile*'
end

task :lint => [:ruby, :reek, :flay, :roodi, :cane, :excellent, :rubocop] do
end
