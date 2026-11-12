cask "wordcraft" do
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.18.1/wordcraft-0.18.1-macos-universal.dmg"
        sha256 "89f6e0a910f8ad5a815d8024c79324d205b56fcd2e05deed010e9016f5813dec"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.18.1/wordcraft-0.18.1-linux-aarch64.AppImage"
            sha256 "11e9a11c0dc924c2a261207d8cf45ee232930bf0692533a2e984237f681e073c"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.18.1/wordcraft-0.18.1-linux-x86_64.AppImage"
            sha256 "bbc5c15b06d4403cfd5a59475bdf9264a49c2bcf1f92d123311b50a9dce3c888"
        end
    end

    name "WordCraft"
    desc "Word-style word processor for .docx files"
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
