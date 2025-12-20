class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.0.0"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  
  def install
    bin.install "eduardo-kirk"
  end
end
