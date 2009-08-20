require 'config/requirements'
require 'config/hoe' # setup Hoe + all gem configuration

Dir['tasks/**/*.rake'].each { |rake| load rake }

#
#require 'rubygems'
#require 'rake'
#require 'rake/testtask'
#require 'rake/rdoctask'
#require 'rake/packagetask'
#require 'rake/gempackagetask'
#require 'rake/contrib/rubyforgepublisher'
#require 'lib/scruffy'
#require 'spec'
#require 'diff/lcs'
#require 'spec/rake/spectask'
#
#PKG_NAME = "scruffy"
#PKG_VERSION   = Scruffy::VERSION::STRING
#PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"
#PKG_FILES = FileList[
#  '[A-Z]*',
#  'lib/**/*.rb', 
#  'spec/**/*.rb'
#]
#
#desc 'Runs all RSpec specs (set RCOV=true for coverage output)'
#Spec::Rake::SpecTask.new do |t|
#  t.spec_files = FileList['spec/**/*_spec.rb']
#  t.rcov = ENV['RCOV']
#end
#
#desc "Deploy docs to RubyForge" 
#task :rdoc_deploy => [:rdoc] do
#  dirs = %w{doc}
#  onserver = "brasten@rubyforge.org:/var/www/gforge-projects/scruffy" 
#  dirs.each do | dir|
#    `scp -r "#{`pwd`.chomp}/#{dir}" "#{onserver}"`
#  end
#end
#
## Genereate the RDoc documentation
#Rake::RDocTask.new { |rdoc|
#  rdoc.rdoc_dir = 'doc'
#  rdoc.title    = "Scruffy - Graphing Library for Ruby"
##  rdoc.options << '--line-numbers --inline-source --main README --accessor adv_attr_accessor=M'
##  rdoc.template = "#{ENV['template']}.rb" if ENV['template']
#  rdoc.rdoc_files.include('README', 'CHANGES', 'MIT-LICENSE')
#  rdoc.rdoc_files.include('lib/scruffy.rb')
#  rdoc.rdoc_files.include('lib/scruffy/*.rb')
#  rdoc.rdoc_files.include('lib/scruffy/layers/*.rb')
#  rdoc.rdoc_files.include('lib/scruffy/renderers/*.rb')
#  rdoc.rdoc_files.include('lib/scruffy/components/*.rb')
#  rdoc.rdoc_files.include('lib/scruffy/helpers/*.rb')
#  rdoc.rdoc_files.include('lib/scruffy/rasterizers/*.rb')
#}
#
#spec = Gem::Specification.new do |s|
#  s.name = PKG_NAME
#  s.version = PKG_VERSION
#  s.author = AUTHOR
#  s.email = "brasten@nagilum.com"
#  s.homepage = "http://scruffy.rubyforge.org"
#  s.summary = "A powerful, clean graphing library for Ruby."
#  s.add_dependency('builder', '>= 2.0')  
#  s.description = <<-EOF
#    Scruffy is a Ruby library for generating powerful graphs.  It is based on
#    SVG, allowing for powerful, clean code, as well as a good foundation for
#    future features.
#  EOF
#
#  s.files = PKG_FILES.to_a
#  s.has_rdoc = true
#  s.rubyforge_project = "scruffy"
#end
#
#Rake::GemPackageTask.new(spec) do |pkg|
#  pkg.need_zip = true
#  pkg.need_tar = true
#end
#
#task :verify_user do
#  raise "RUBYFORGE_USER environment variable not set!" unless ENV['RUBYFORGE_USER']
#end
#
#task :verify_password do
#  raise "RUBYFORGE_PASSWORD environment variable not set!" unless ENV['RUBYFORGE_PASSWORD']
#end
#
#desc "Publish gem+tgz+zip on RubyForge. You must make sure lib/version.rb is aligned with the CHANGELOG file"
#task :publish_packages => [:verify_user, :verify_password, :package] do
#  require 'meta_project'
#  require 'rake/contrib/xforge'
#  release_files = FileList[
#    "pkg/#{PKG_FILE_NAME}.gem",
#    "pkg/#{PKG_FILE_NAME}.tgz",
#    "pkg/#{PKG_FILE_NAME}.zip"
#  ]
#
#  Rake::XForge::Release.new(MetaProject::Project::XForge::RubyForge.new(PKG_NAME)) do |xf|
#    # Never hardcode user name and password in the Rakefile!
#    xf.user_name = ENV['RUBYFORGE_USER']
#    xf.password = ENV['RUBYFORGE_PASSWORD']
#    xf.files = release_files.to_a
#    xf.release_name = "Scruffy #{PKG_VERSION}"
#  end
#end