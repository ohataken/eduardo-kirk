class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.13"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "1959c0be67bd45ccb28c679406ce9ffd9c22a620b556c1149a52f79c76901bd3"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
