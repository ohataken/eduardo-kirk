class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.0"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "7401f20e9ff967bdff47c568089b5ce97e788d5fc96a980a2eb790163a563e65"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
