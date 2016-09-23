# encoding: utf-8

desc "Build site using hugo"
task :build => :clean do
  sh "hugo"
end


desc "Merge develop into master, check for build errors, push to master, and switch back to develop to keep working"
task :deploy => [:ensure_clean_working_directory, :merge_develop, :build] do
  sh "git push origin master"
  sh "git checkout develop"
end


desc "Merge develop into master"
task :merge_develop => :checkout_master do
  sh "git merge develop"
end


# Get the current git branch
def current_branch
  `git rev-parse --abbrev-ref HEAD`.strip
end


# Get current git status as Array of Strings
def git_statuses
  `git status --porcelain`.split(/\n/).map(&:strip)
end


desc "Checkout the master branch"
task :checkout_master do
  if current_branch != "master"
    sh "git checkout master"
  end
  sh "git merge origin/master"
end


desc "Ensure clean working directory"
task :ensure_clean_working_directory do
  statuses = git_statuses.reject {|s|
    # ignore new files
    s =~ /\A\?\?/
  }
  unless statuses.empty?
    formatted_statuses = statuses.map {|s| "\t#{s}\n" }.join("")
    raise "There are outstanding edits! Please commit or stash the following files before proceeding:\n\n#{formatted_statuses}\n"
  end
end


desc "Run the hugo server"
task :serve => :clean do
  sh "hugo serve"
end


desc "Remove the hugo build directory (/public)"
task :clean do
  rm_rf "public"
end
