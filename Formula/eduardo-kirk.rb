class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.20"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "27f94134d9e29283f2c144492e7e6e5102932c56c4052128672f6b36ca38971f"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
