cask "lightcraft" do
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-0.6.0-macos-universal.dmg"
    sha256 "73021243e351d7a5ea78f0c8aad7a7e9abba471b7be32e8fcd4d03e98078b50a"
    app "Lightcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-0.6.0-linux-aarch64.AppImage"
      sha256 "ccefe78ec7f61f7804ac72ba0fad5d95f37b0b059d9e4d165e9fb22d31c2eb3d"
    else
      url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-0.6.0-linux-x86_64.AppImage"
      sha256 "577ef018dceec8d4980d2f9b20782ec37848158b8e6419cc90d31c2b580c1919"
    end
  end

  name "Lightcraft"
  desc "Lightroom-style photo library and raw development (Rust + egui)."
  homepage "https://github.com/storytold/lightcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/lightcraft",
    "~/.local/share/lightcraft",
    "~/.cache/lightcraft",
  ]
end
