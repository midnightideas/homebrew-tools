cask "lightcraft" do
  version "0.7.1"

  on_macos do
    url "https://github.com/storytold/lightcraft/releases/download/v0.7.1/lightcraft-0.7.1-macos-universal.dmg"
    sha256 "9c7aaf1ab532ee81819fded3ec451af5a2bad3b7c1b5c9d48e36b82239331457"
    app "LightCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/lightcraft/releases/download/v0.7.1/lightcraft-0.7.1-linux-aarch64.AppImage"
      sha256 "789419fd038ae857a0b5caa1968cc7247ae479c3819deabedaa42c11ab91733e"
    else
      url "https://github.com/storytold/lightcraft/releases/download/v0.7.1/lightcraft-0.7.1-linux-x86_64.AppImage"
      sha256 "78078794a6bd8f1026036f2503a1cf716ad2c3b57e1ca8b2bdc46472099c1e48"
    end
  end

  name "LightCraft"
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
