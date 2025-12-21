class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.2"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "e5b54912eefffc0b06c3add8e71bda27e75826f1b50d65a53d65cc96be184054"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
