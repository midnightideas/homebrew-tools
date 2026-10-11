cask "wordcraft" do
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-0.5.0-macos-universal.dmg"
    sha256 "855812f19a1a27b6dc0bbb5c7ac71c3a60b84f5301b4b970be8ba3c5dfdfece5"
    app "Wordcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-0.5.0-linux-aarch64.AppImage"
      sha256 "e8b50b89cd119e436c423cef2cfeff385b35e81b5849689204c27eb6d9815bb3"
    else
      url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-0.5.0-linux-x86_64.AppImage"
      sha256 "9477ea92dd9edf2ab974bde32595845b2737b27b24c7a40659cb5dce27b27551"
    end
  end

  name "Wordcraft"
  desc "Word-style word processor for .docx files (Rust + egui)."
  homepage "https://github.com/storytold/wordcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/wordcraft",
    "~/.local/share/wordcraft",
    "~/.cache/wordcraft",
  ]
end
