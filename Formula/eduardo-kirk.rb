class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.4"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "8196fc1bbb58f9ced6fdd178e693b89c51c453bcf66e169cfcf918c00acb5c92"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
