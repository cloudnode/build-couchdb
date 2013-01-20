# OSX patch stuff

require 'fileutils'

desc 'Applying patches for OSX'
task :patch do
  unless File.file? '.patched'
    sh "patch -i tasks/osx/patch-otp-makefile.diff dependencies/otp/erts/emulator/Makefile.in"
    sh "patch -i tasks/osx/patch-icu-configure.diff dependencies/icu4c-4_4/source/configure"
    sh "patch -i tasks/osx/patch-couchdb-makefile.diff dependencies/couchdb/src/couchdb/priv/Makefile.am"
    sh "patch -i tasks/osx/patch-os_process.diff dependencies/couchdb/src/couchdb/couch_os_process.erl"
    sh "touch .patched"
  end
end

task :clean do
  if File.file? '.patched'
    sh "patch -R -i tasks/osx/patch-otp-makefile.diff dependencies/otp/erts/emulator/Makefile.in"
    sh "patch -R -i tasks/osx/patch-icu-configure.diff dependencies/icu4c-4_4/source/configure"
    sh "patch -R -i tasks/osx/patch-couchdb-makefile.diff dependencies/couchdb/src/couchdb/priv/Makefile.am"
    sh "patch -R -i tasks/osx/patch-os_process.diff dependencies/couchdb/src/couchdb/couch_os_process.erl"
    sh "rm -f .patched"
  end
end
