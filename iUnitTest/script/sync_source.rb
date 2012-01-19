#!/usr/bin/env ruby
# -*- coding:UTF-8 -*-
require "fileutils"

path = File.expand_path(File.dirname __FILE__)

dst_path = File.join(path, "../tmp")

FileUtils.mkdir_p dst_path

Dir.chdir(dst_path) do
  unless File.exist? "iunittest"
    system "git clone git@github.com:katsuyoshi/iunittest.git"
  end
  src_path = "../iUnitTest/iunittest"
  dst_path = "iunittest/iUnitTest/iUnitTest"
  FileUtils.cp_r src_path, dst_path
  Dir.chdir "iunittest" do
    [
      "iUnitTest/iUnitTest/iunittest/IUTMainWindow.xib"
    ].each do |f|
      system "git checkout #{f}"
    end
  end
end
