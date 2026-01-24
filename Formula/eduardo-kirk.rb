class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.10"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "0ff7def6a169dfd5a8ecda45c8e2ca5ed6fd5e6d3fe4c2797847cd9f7a80cd4b"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
