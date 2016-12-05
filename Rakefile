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
  sh 'find . \\( -wholename \'*/bin/*\' -o -wholename \'*/ts/*.js\' -o -wholename \'*/dash/lib/*\' -o -wholename \'*/ash/lib/*\' -o -name \'*.bc\' -o -name \'*.aux\' -o -name \'*.jad\' -o -name \'*.m\' -o -name \'*.snu\' -o -name \'*.txt\' -o -name \'*.md\' -o -name \'*.rkt\' -o -name \'*.clj\' -o -name \'*.lsp\' -o -name .yaws -o -name \'*.pdf\' -o -name \'*.ps\' -o -wholename \'*/.idea/*\' -o -name \'*.iml\' -o -name \'*.ser\' -o -name \'*.[ps]k\' -o -name \'*.flip\' -o -name \'*.db\' -o -name \'*.log\' -o -wholename \'*/bower_components/*\' -o -wholename \'*/vendor/*\' -o -wholename \'*/*.xcodeproj/*\' -o -wholename \'*/*.dSYM/*\' -o -wholename \'*/build/*\' -o -wholename \'*/*.app/*\' -o -name \'*.scpt\' -o -wholename \'*/perl/Makefile\' -o -wholename \'*/CMakeFiles/*\' -o -name \'*.cmake\' -o -name \'*.lock\' -o -name \'*.cm[io]\' -o -name \'*.hi\' -o -name \'*.swiftdoc\' -o -name \'*.swiftmodule\' -o -name \'*.rlib\' -o -name \'*.dylib\' -o -name \'*.so\' -o -name \'*.o\' -o -name \'*.beam\' -o -name \'*.dump\' -o -name \'*.pyc\' -o -name \'*.jar\' -o -name \'*.class\' -o -name \'*.bin\' -o -wholename \'*/tmp/*\' -o -name .gitmodules -o -wholename \'*/.git/*\' -o -wholename \'*/node_modules/*\' -o -wholename \'*/.cabal/*\' -o -name \'*.ttf\' -o -name \'*.plist\' -o -name \'*.dot\' -o -name \'*.wav\' -o -name \'*.jpeg\' -o -name \'*.jpg\' -o -name \'*.ico\' -o -name \'*.png\' -o -name \'*.gif\' -o -name .DS_Store -o -name Thumbs.db \\) -prune -o -type f -print | pargs -n 100 node_modules/.bin/editorconfig-tools check'
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

task :bashate => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs bashate'
end

task :shlint => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs shlint'
end

task :checkbashisms => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs checkbashisms -n -p'
end

task :shellcheck => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs shellcheck'
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
  :bashate,
  :bandit,
  :shlint,
  :checkbashisms,
  :shellcheck
] do
end

task :clean => [
  :clean_astyle
] do
end
