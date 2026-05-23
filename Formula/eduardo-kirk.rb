class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.16"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "5e668c5b3ceb04f8451fce977d9b37d3adaa4902fa42ab674ffcf4081c2eb002"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
