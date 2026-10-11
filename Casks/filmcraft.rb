cask "filmcraft" do
  arch arm:   "arm64",
       intel: "amd64"

  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-0.6.0-macos-universal.dmg"
    sha256 "3e8d92a082c98aa3477c00313d0784c18f681e94ed91a494712d4d8b36297e3b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-0.6.0-linux-aarch64.AppImage"
      sha256 "d6994dd3e25c5505119eb2763eb34b590a736ac90dcaec608b77aac4d3305b37"
    else
      url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-0.6.0-linux-x86_64.AppImage"
      sha256 "c0b5a5d0f0e71176aa806c895f8ca513f2d505b70fef85b874bbe23c91232bc7"
    end
  end

  name "Filmcraft"
  desc "Premiere-style non-linear video editor (Rust + egui)."
  homepage "https://github.com/storytold/filmcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Filmcraft.app"
  binary "filmcraft-cli"

  zap trash: [
    "~/.config/filmcraft",
    "~/.local/share/filmcraft",
    "~/.cache/filmcraft",
  ]
end
