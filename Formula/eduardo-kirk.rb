class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.5"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "20449b2bfb474632f2f55de682bb9ae5e9cf150e6af42fa821d97f35c9502b92"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
