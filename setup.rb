#!/usr/bin/ruby
require 'fileutils'

include FileUtils

@dest = "/Library/Application Support/Developer/Shared/Xcode"
@path = File.dirname(__FILE__)

def copy_project_tmplate
  original_project_dir = File.join(@path, "iUnitTest");
  target_dir = File.join(@path, "tmp/Project Templates/Application/");
  project_dir = File.join(target_dir, "iUnitTest Application")

  # copy project and rename
  rm_rf File.join(@path, "tmp")
  mkdir_p target_dir
  cp_r original_project_dir, target_dir
  mv File.join(target_dir, "iUnitTest"), project_dir

  # remove unnessasary files
  Dir.glob(File.join(target_dir, '**', '.git')).each { |x| rm_f(x) }
  Dir.glob(File.join(target_dir, '**', '*.{mode1v3,pbxuser}')).each { |x| rm_f(x) }

  # replace target name
  pbxproj_file = File.join(project_dir, "iUnitTest.xcodeproj/project.pbxproj");
  context = File.read pbxproj_file
  context.gsub!(/iUnitTest/, "«PROJECTNAME»")
  context.gsub!(/«PROJECTNAME»_Prefix.pch/, "iUnitTest_Prefix.pch")
  File.open(pbxproj_file, "w") do |file|
    file.write context
  end

  # remove installed project
  install_dir =  File.join(@dest, "Project Templates/Application/iUnitTest Application")
  rm_rf install_dir if File.directory? install_dir

  cp_r(File.join(@path, "tmp/Project Templates"), @dest)
  rm_rf File.join(@path, "tmp")
end


def replace_tags extention
  work_dir = File.join(@path, "tmp")
  Dir.glob(File.join(work_dir, "**", "*.#{extention}")).each do |filename|
    context = File.read filename
    match = nil
    case extention
    when "m"
      context.gsub!(/@implementation\s+\w+/, "@implementation «FILEBASENAMEASIDENTIFIER»")
      /^\/\/\s+(\w+).m/ =~ context
      match = $1
      context.gsub!(Regexp.new("#{match}.m"), "«FILENAME»")
    when "h" 
      context.gsub!(/@interface\s+\w+/, "@interface «FILEBASENAMEASIDENTIFIER»")
      /^\/\/\s+(\w+).h/ =~ context
      match = $1
      context.gsub!(Regexp.new("#{match}.h"), "«FILENAME»")
    end
    
    context.gsub!(Regexp.new("#import\s+\"#{match}.h\""), "«OPTIONALHEADERIMPORTLINE»") if match
    context.gsub!(/iUnitTestTest/, "«PROJECTNAME»")
    context.gsub!(/\d+\/\d+\/\d+/, "«DATE»")
    /^\/\/\s+Copyright\s+(\d+)/ =~ context
    match = $1
    context.gsub!(Regexp.new("#{match}"), "«YEAR»")
    context.gsub!(/Katsuyoshi Ito/, "«FULLUSERNAME»")
    context.gsub!(/ITO SOFT DESIGN Inc/, "«ORGANIZATIONNAME»")
    File.open(filename, "w") do |file|
      file.write context
    end
  end
end

def copy_file_template
  work_dir = File.join(@path, "tmp")
  mkdir_p work_dir
  cp_r File.join(@path, "templates/File Templates"), work_dir

  replace_tags "m"
  replace_tags "h"
  
  # remove installed project
  install_dir =  File.join(@dest, "File Templates/iUnitTest")
  rm_rf install_dir if File.directory? install_dir
  
  src = File.join(@path, "tmp/File Templates")
  cp_r(src, @dest)
  rm_rf File.join(@path, "tmp")
end


mkdir_p @dest
copy_project_tmplate
copy_file_template