cask "pdfcraft" do
  version "0.7.1"

  on_macos do
    url "https://github.com/storytold/pdfcraft/releases/download/v0.7.1/pdfcraft-0.7.1-macos-universal.dmg"
    sha256 "cafa51b2bbd2fa7fd532cb38cafec54e988dd37c81bc47c26e5f08e472dc92bf"
    app "PDFcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/pdfcraft/releases/download/v0.7.1/pdfcraft-0.7.1-linux-aarch64.AppImage"
      sha256 "3d36374bc10f541a92142ba3d884a827bbdd8ac88932ce20c26ccc52b1727f84"
    else
      url "https://github.com/storytold/pdfcraft/releases/download/v0.7.1/pdfcraft-0.7.1-linux-x86_64.AppImage"
      sha256 "ae5c879bb326d0e91a241e9f9c6c17608ef766c005c66c2d7280270107bf635a"
    end
  end

  name "PDFcraft"
  desc "Acrobat-style PDF viewer and editor (Rust + egui)."
  homepage "https://github.com/storytold/pdfcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/pdfcraft",
    "~/.local/share/pdfcraft",
    "~/.cache/pdfcraft",
  ]
end
