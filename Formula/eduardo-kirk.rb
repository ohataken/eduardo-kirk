class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.4"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "4095929e2fc617599c9a3df8c14f90842a5c5f2a220ccc811fd51398ce2e4262"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
