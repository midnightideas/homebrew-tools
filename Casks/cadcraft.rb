cask "cadcraft" do
  arch arm:   "arm64",
       intel: "amd64"

  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-0.5.0-macos-universal.dmg"
    sha256 "f7c9a84707eae58405d8930764abfddacb89531571d63a4a49d9b9b735f6f8a7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-0.5.0-linux-aarch64.AppImage"
      sha256 "e4333d6798eb58cf7ceb7818bab0f206b64b0617e3969bf2b677105594956656"
    else
      url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-0.5.0-linux-x86_64.AppImage"
      sha256 "d29756693af2b1c44115dfda67b73d051f9d65e9e36852926744b5f312ae85c6"
    end
  end

  name "CADcraft"
  desc "AutoCAD-style 2D/3D CAD application (Rust + egui)."
  homepage "https://github.com/storytold/cadcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "CADcraft.app"
  binary "cadcraft-cli"

  zap trash: [
    "~/.config/cadcraft",
    "~/.local/share/cadcraft",
    "~/.cache/cadcraft",
  ]
end
