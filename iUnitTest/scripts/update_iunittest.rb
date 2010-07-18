require 'fileutils'

include FileUtils

@src = "/Library/Application Support/Developer/Shared/Xcode/Project Templates/Application/iUnitTest Application"
@path = File.join(File.dirname(__FILE__), "../")

mkdir_p File.join(@path, "scripts")

cp_r(File.join(@src, "scripts"), @path) if File.exist? File.join(@src, "scripts")

cp(File.join(@src, "Classes/IUTAppDelegate.h"), File.join(@path, "Classes/IUTAppDelegate.h"))
cp(File.join(@src, "Classes/IUTAppDelegate.m"), File.join(@path, "Classes/IUTAppDelegate.m"))
cp_r(File.join(@src, "Classes/UnitTest"), File.join(@path, "Classes"))
cp_r(Dir.glob("#{@src}/*.bundle"), @path)
cp(Dir.glob("#{@src}/*.xib"), @path)
cp(Dir.glob("#{@src}/*.png"), @path)
