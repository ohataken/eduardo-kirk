class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.15"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "90b732452b44982013a450ecd0441048bd34e1709703bfa052f0e5de30da99fa"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
