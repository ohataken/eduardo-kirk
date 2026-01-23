class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.8"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "9078a5094fe7bca32c1ed2875ebe916f56e802293c0c359a34e77e816ce99ee8"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
