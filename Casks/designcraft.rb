cask "designcraft" do
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-0.6.0-macos-universal.dmg"
    sha256 "e1d520e229aff1959b5cef7abfdbfa48ba3caccdf81bf77d01a59cf35855318a"
    app "Designcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-0.6.0-linux-aarch64.AppImage"
      sha256 "8ce48f480e6cf8839bb222671c63fdbc18417722b32511d60ea6f5f16dad01d0"
    else
      url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-0.6.0-linux-x86_64.AppImage"
      sha256 "fb62e7e7a9adee2fd7f400b2ba26093b96a803470a7d8d476e39196f05c4c034"
    end
  end

  name "Designcraft"
  desc "InDesign-style page layout application (Rust + egui)."
  homepage "https://github.com/storytold/designcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/designcraft",
    "~/.local/share/designcraft",
    "~/.cache/designcraft",
  ]
end
