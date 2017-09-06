task :default => :lint

task :ruby => [] do
  sh 'find . -name "*.rb" -exec ruby -wc {} 2>&1 \; | grep -v "Syntax OK" | grep -v openssl | grep -v rubygems; true'
end

task :reek => [] do
  sh 'bundle exec reek -q .; echo ""'
end

task :flay => [] do
  sh 'bundle exec flay .'
end

task :roodi => [] do
  sh 'find . -name "*.rb" -exec bundle exec roodi -config=roodi.yml {} \\;'
end

task :cane => [] do
  sh 'find . -name "*.rb" -exec bundle exec cane -f {} \\;'
end

task :excellent => [] do
  sh 'bundle exec excellent .'
end

task :rubocop => [] do
  sh 'find . \\( -name "*.rb" -or -name "*.rb" -or -name "Guardfile*" \\) -exec rubocop {} \\; | grep -v "no offenses detected" | grep -v "Inspecting 1 file" | grep -v "^\\\\.$" | grep -v "^$"; echo ""'
end

task :tailor => [] do
  sh 'bundle exec tailor'
end

task :cowl => [] do
  sh 'cowl .'
end

task :gtdlint => [] do
  sh 'gtdlint .'
end

task :lili => [] do
  sh 'bundle exec lili .'
end

task :editorconfig=> [] do
  sh 'flcl . | xargs -n 100 editorconfig-cli check'
end

task :astyle_apply => [] do
  begin
    sh 'find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[ch]" -exec astyle {} \\; | grep -v Unchanged'
  rescue
  end
end

task :astyle => [] do
  begin
    sh 'find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[ch]" -exec astyle --dry-run {} \\; | grep -v Unchanged'
  rescue
  end
end

task :clean_astyle => [] do
  sh 'find . -type f -name "*.orig" -exec rm {} \\;'
end

task :xmllint => [] do
  sh 'find . -name "*.xml" -exec xmllint --noout {} 2>&1 \\;'
end

task :infernu => [] do
  sh 'find . -type d -name node_modules -prune -o -type d -name bower_components -prune -o -type d -name target -prune -o -type f -name "*.js" -exec infernu {} \\;'
end

task :bandit => [] do
  sh 'find . -name \'*.py\' | xargs bandit'
end

task :shfmt => [] do
  sh 'stank . | xargs shfmt -w -i 4'
end

task :bashate => [] do
  sh 'stank . | xargs bashate'
end

task :shlint => [] do
  sh 'stank . | xargs shlint'
end

task :checkbashisms => [] do
  sh 'stank . | xargs checkbashisms -n -p'
end

task :shellcheck => [] do
  sh 'stank . | xargs shellcheck'
end

task :funk => [] do
  sh 'funk .'
end

task :lint => [
  :ruby,
  :reek,
  :flay,
  :roodi,
  :cane,
  :excellent,
  :rubocop,
  :tailor,
  :cowl,
  :gtdlint,
  :lili,
  :editorconfig,
  :astyle,
  :xmllint,
  :infernu,
  :shfmt,
  :bashate,
  :bandit,
  :shlint,
  :checkbashisms,
  :shellcheck,
  :funk
] do
end

task :clean => [
  :clean_astyle
] do
end
