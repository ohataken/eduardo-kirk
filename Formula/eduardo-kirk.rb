class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.18"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "92c106fe96682ebe7e660020ef40a57a7744fded9ce5d5d99872d4ecb484298d"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
