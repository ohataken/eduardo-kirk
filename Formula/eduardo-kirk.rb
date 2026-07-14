class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.19"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "4cde68a1ef964e1495e449fa9fff55bf540c95fe232efe0d4e694972127721df"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
