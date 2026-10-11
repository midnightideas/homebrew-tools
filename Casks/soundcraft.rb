cask "soundcraft" do
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-0.5.0-macos-universal.dmg"
    sha256 "2d1ceb00a6a0d5533defa08ff95d49432f7e7455d831613d9d1767c30bf499a2"
    app "Soundcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-0.5.0-linux-aarch64.AppImage"
      sha256 "b74c4d8b3078a9b97415ac90c0c8bd1d74002c7cf3fa5db853d60ebd2f133c5c"
    else
      url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-0.5.0-linux-x86_64.AppImage"
      sha256 "ca008be461b57ca16975f94f9fc758f39d727d4477c3211e3f5b1ea46bead272"
    end
  end

  name "Soundcraft"
  desc "Pro Tools-style digital audio workstation (Rust + egui)."
  homepage "https://github.com/storytold/soundcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/soundcraft",
    "~/.local/share/soundcraft",
    "~/.cache/soundcraft",
  ]
end
