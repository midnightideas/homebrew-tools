cask "soundcraft" do
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/soundcraft/releases/download/v0.6.1/soundcraft-0.6.1-macos-universal.dmg"
    sha256 "94f014708e0173c13630bb8fa4163124d3bbb7af571e0f03d9f9b3027f90d0e7"
    app "SoundCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/soundcraft/releases/download/v0.6.1/soundcraft-0.6.1-linux-aarch64.AppImage"
      sha256 "ec80d1bbd66d4c0102272b1462368e92a0504e4d99466255e46477fb5f907852"
    else
      url "https://github.com/storytold/soundcraft/releases/download/v0.6.1/soundcraft-0.6.1-linux-x86_64.AppImage"
      sha256 "68c658f2e72d74a3277f48df3ce13e4db9c6eafd7f1425f63e2dc85d86791200"
    end
  end

  name "SoundCraft"
  desc "Pro Tools-style digital audio workstation"
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
