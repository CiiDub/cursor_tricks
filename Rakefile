require 'fileutils'

@package_name = 'Cursor Tricks'
@bbpackages_path = "#{Dir.home}/Library/Application Support/BBEdit/Packages/"
@bbfolders_path = "#{Dir.home}/Library/Application Support/BBEdit"
@osa_source = FileList['Uncompiled Applescript/**/*.applescript']

# Methods
# Checks files from source folder against target folder and copies them if out of date.
# Returns True if any copies were made, False otherwise.
def check_and_copy( src_dir, trg_dir, src_list, work_msg  )
	needed_work = false
	src_list.reject! { | path | File.directory? path }.each do | s_file |
		t_file = s_file.gsub( src_dir, trg_dir )
		unless uptodate?( t_file, [s_file] )
			needed_work = true
			puts work_msg
			cp s_file, t_file
		end
	end
	return needed_work
end

# Takes a folder name from Uncompiled Applescript and makes a list of file tasks.
def collect_osa_from_dir ( dir )
	osa_tasks = []
	@osa_source.each do | s |
		trg_dir = "Contents" if [ 'Resources' ].include?( dir )
		trg_dir = "Contents/Scripts" if [ 'Lines', 'White Space' ].include?( dir )
		trg_dir = "#{@bbfolders_path}" if [ 'Menu Scripts' ].include?( dir )
		next unless s.include? "/#{dir}/"
		osa_tasks << s
		.gsub( "Uncompiled Applescript/#{dir}/", "#{trg_dir}/#{dir}/" )
		.gsub( '.applescript', '.scpt' )
	end
	return osa_tasks
end

# Takes *.scpt as file-command and looks for a dependency (*.applescript) in the Uncompiled Applescript folder.
rule '.scpt' => [ proc { | task_name | t = task_name
	.gsub( %r'[/ \S/]*[ \S]+/', '' )
	.gsub( '.scpt', '' ) 
	@osa_source.grep %r'#{Regexp.quote(t)}'
}] do | t |
	puts 'Compiling'
	sh %{osacompile -o '#{t.name}' '#{t.source}'}
end

namespace :lines do
	osa_tasks = collect_osa_from_dir ( 'Lines' )

	desc 'Compiles all applescripts under Lines.'
	task :compile => osa_tasks do
		puts "Lines applescripts are compiled."
	end
end

namespace :white_space do 
	osa_tasks = collect_osa_from_dir ( 'White Space' )

	desc 'Compiles all applescripts in White Space.'
	task :compile => osa_tasks do
		puts "White Space applescripts are compiled."
	end
end

namespace :resources do
	osa_tasks = collect_osa_from_dir ( 'Resources' )

	desc 'Compiles all applescripts in Resources.'
	task :compile => osa_tasks do
		puts "Resource applescripts are compiled."
	end
end

namespace :menu_scripts do
	osa_tasks = collect_osa_from_dir ( 'Menu Scripts' )

	desc 'Compiles & installs into ../BBedit/Menu Scripts/, you must run this command explicitly.'
	task :install => osa_tasks do
		puts "Menu Scripts are compiled and installed."
	end
end

desc "Backs up the installed (and presumably working) copy of this package as #{@package_name}.backup."
task :backup do
	did_back_up = false
	cd @bbpackages_path, :verbose => false do
		target = "#{@package_name}.backup"
		src = ["#{@package_name}.bbpackage"]
		unless uptodate?( target, src )
			backed_up = false
			puts 'Backing up package.'
			rm_r target if Dir.exists?( target )
			cp_r src[0], target
		end
		did_back_up = check_and_copy( src[0], target, FileList["#{src[0]}/**/*"], "Updating back-up."  )
	end
	puts "All backed up." unless did_back_up
end

desc 'Compiles all applescripts.'
task :compile => [ 'lines:compile', 'white_space:compile', 'resources:compile' ]

desc "Installs this project as a #{@package_name}.bbpackage into BBedits Packages folder."
task :install => [ :compile, :backup ] do
	did_install = false
	src = FileList["#{pwd}/**/*"]
	trg = FileList["#{@bbpackages_path}#{@package_name}.bbpackage/**/*"]
	
	unless src.length == trg.length
 		did_install = true
	end

	if did_install
		puts "Installing #{@package_name} for use by BBedit."
 		rm_r "#{@bbpackages_path}#{@package_name}.bbpackage/"
 		cp_r pwd, "#{@bbpackages_path}#{@package_name}.bbpackage"
 	else
		did_install = check_and_copy( pwd, "#{@bbpackages_path}#{@package_name}.bbpackage", src, "Updating #{@package_name}." )
	end
	puts "Package is up to date." unless did_install
end