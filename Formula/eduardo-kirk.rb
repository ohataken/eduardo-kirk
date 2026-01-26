class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.13"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "a521a4bef217366665f4a6b958faf9961eeae54ecdb43317e7b91084fb0c7ef6"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
