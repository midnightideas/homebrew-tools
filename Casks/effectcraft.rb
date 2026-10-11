cask "effectcraft" do
  version "0.8.0"

  on_macos do
    url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-0.8.0-macos-universal.dmg"
    sha256 "b8d946bd48b3c9084f9210be9d45e41a6c6c0f1060365bdf0e842b440961a453"
    app "Effectcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-0.8.0-linux-aarch64.AppImage"
      sha256 "07b09d3790a8e29b05efc1842cc4e0aec2fd192bc3a5bd04574c55b07c7b9818"
    else
      url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-0.8.0-linux-x86_64.AppImage"
      sha256 "31221dab631fef3a38d140546ffc2a6955459b859877845a8282d9a97239b373"
    end
  end

  name "Effectcraft"
  desc "After Effects-style motion graphics and compositing (Rust + egui)."
  homepage "https://github.com/storytold/effectcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/effectcraft",
    "~/.local/share/effectcraft",
    "~/.cache/effectcraft",
  ]
end
