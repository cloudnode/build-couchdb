# Master control of the build system
HERE = File.expand_path(File.dirname(__FILE__))

require "#{HERE}/tasks/lib"

# patch
import 'tasks/osx/patch.rake'
task :default => [:patch]
  
Dir[ File.dirname(__FILE__) + '/tasks/*.rake' ].sort.each { |subtask| import subtask }
