cask "wordcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.9.0/wordcraft-0.9.0-macos-universal.dmg"
        sha256 "500e90d726eeb2aa45af7bb015c2d132172516853f9674bcdec732af6f0bc1b8"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.9.0/wordcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "cd63f14d799b2963f92083789e948173dc8c4215271f23f0837d9577e5eb6d18"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.9.0/wordcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "5022a32d1ff62d4641010c19fdc16b8655168686537af9d30615a03d34c6afb0"
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
