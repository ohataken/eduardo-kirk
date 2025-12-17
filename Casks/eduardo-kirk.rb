cask "eduardo-kirk" do
  version "1.0.0"
  sha256 "..."
  
  url "https://github.com/ohataken/eduardo-kirk/releases/download/v#{version}/EduardoKirk-#{version}.dmg"
  name "EduardoKirk"
  desc "Session event notification handler"
  homepage "https://github.com/ohataken/eduardo-kirk"
  
  app "EduardoKirk.app"
end
