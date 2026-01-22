class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.7"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "59d90b3ca086a412eebf04d7665b824a6cc073adc12caf8af76d11309cd6de26"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
