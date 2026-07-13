class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.17"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "f08d0249bb382ac0a08a4411cb00fbd18aabd188a62a02581169f28102dfaa38"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
