class EduardoKirk < Formula
  desc "desktop notifications for Claude Code"
  homepage "https://github.com/ohataken/eduardo-kirk"
  version "0.1.7"
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/eduardo-kirk-#{version}.tar.gz"
  sha256 "496b1c5d75c9743da6b806ec2a353672bfd9a2c44596bbd2517bafeb6cc98c07"
  
  def install
    bin.install "EduardoKirkCommand" => "eduardo-kirk"
  end
end
