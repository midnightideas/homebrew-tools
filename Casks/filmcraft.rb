cask "filmcraft" do
  version "0.7.2"

  on_macos do
    url "https://github.com/storytold/filmcraft/releases/download/v0.7.2/filmcraft-0.7.2-macos-universal.dmg"
    sha256 "df8f6ec7f7c7d227549c20579c65b9f6b2635ccd994410bb70c8d0369a6b9fb7"
    app "FilmCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/filmcraft/releases/download/v0.7.2/filmcraft-0.7.2-linux-aarch64.AppImage"
      sha256 "d2767bb36ae350465ad07317f927029b5a89fbb140499da649363be0c66dc849"
    else
      url "https://github.com/storytold/filmcraft/releases/download/v0.7.2/filmcraft-0.7.2-linux-x86_64.AppImage"
      sha256 "abf920d98d015860e1f5badc6cf0507d8f8116f5c328f7f7f2425f068ab3aee8"
    end
  end

  name "FilmCraft"
  desc "Premiere-style non-linear video editor"
  homepage "https://github.com/storytold/filmcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/filmcraft",
    "~/.local/share/filmcraft",
    "~/.cache/filmcraft",
  ]
end
