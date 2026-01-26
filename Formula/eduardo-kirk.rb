class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.11"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "698f0822cc010f618c41efcee8c69fdd7f3acb527cdfa6b7c895be44afad7094"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
