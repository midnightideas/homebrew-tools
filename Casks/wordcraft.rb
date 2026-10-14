cask "wordcraft" do
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/wordcraft/releases/download/v0.6.1/wordcraft-0.6.1-macos-universal.dmg"
    sha256 "6cfbc5b0c1270894f4df7eed15f6d880d01f4733f856cee55d3793bd738786ae"
    app "WordCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/wordcraft/releases/download/v0.6.1/wordcraft-0.6.1-linux-aarch64.AppImage"
      sha256 "78edd2b884fee4cfcfe8a072c4f1608759882e524f73c74c92dbc21612db860e"
    else
      url "https://github.com/storytold/wordcraft/releases/download/v0.6.1/wordcraft-0.6.1-linux-x86_64.AppImage"
      sha256 "36ed3844c4e58391cf1341d133bf6b569b5221f8e707e5e271db3c38df6dc3c3"
    end
  end

  name "WordCraft"
  desc "Word-style word processor for .docx files (Rust + egui)."
  homepage "https://github.com/storytold/wordcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/wordcraft",
    "~/.local/share/wordcraft",
    "~/.cache/wordcraft",
  ]
end
