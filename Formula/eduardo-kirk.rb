class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.15"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "5105178672cf3259ba4157c4549dda2daee0bd725498b1174f251b3fd18894b4"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
