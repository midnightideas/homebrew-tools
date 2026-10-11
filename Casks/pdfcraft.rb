cask "pdfcraft" do
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-0.6.0-macos-universal.dmg"
    sha256 "5855e893cb0d406b1aef6ded5dee314f2cd72b783ab82e57c43f2839c3307b0a"
    app "PDFcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-0.6.0-linux-aarch64.AppImage"
      sha256 "7bc61400429a2e37db6d5185c150a8dd793c2590ac3db9fcd9dba44da8dc59e4"
    else
      url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-0.6.0-linux-x86_64.AppImage"
      sha256 "17314af5443f581f4516deaefdabc1e70f83199a61412a10deaf673adaef028c"
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
