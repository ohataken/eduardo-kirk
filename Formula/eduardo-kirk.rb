class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.10"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "aa90cc7533b43d607cdf24b3096f614ad66723bd5bc4c70803eb939f8070f26f"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
