cask "gridcraft" do
  arch arm:   "arm64",
       intel: "amd64"

  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-0.5.0-macos-universal.dmg"
    sha256 "e372170ad95a7625e37b315b168d8be2a5d2547de6de252f838e81bb7de98513"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-0.5.0-linux-aarch64.AppImage"
      sha256 "0e1e6bfab6f50afb038259b0d22e1aedb38200991cac0911918da1937effc3f7"
    else
      url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-0.5.0-linux-x86_64.AppImage"
      sha256 "f97a82d0f21d3381fbb19a0ae0928d65c5cdc402faa5e92008312ce498745ce2"
    end
  end

  name "Gridcraft"
  desc "Excel-style spreadsheet application (Rust + egui)."
  homepage "https://github.com/storytold/gridcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Gridcraft.app"
  binary "gridcraft-cli"

  zap trash: [
    "~/.config/gridcraft",
    "~/.local/share/gridcraft",
    "~/.cache/gridcraft",
  ]
end
