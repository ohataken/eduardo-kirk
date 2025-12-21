class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.2"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "e6d8e5c6bd85d212d96e965188b28af6cdf76fac9f0c7d0e98bcee38983b7d47"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
