cask "deckcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.10.0/deckcraft-0.10.0-macos-universal.dmg"
        sha256 "f528bfd0020e4b339750bfabeadc9ec9c1f05b7a6643dead49f156f97e7ad4f2"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.10.0/deckcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "df14c740c1409c1cb7cf5f653400276757e9b7ed7ac627fe050f18907509dc04"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.10.0/deckcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "0ecdf59c13f76520e7bc7f6381bea5c8acad7d75af7f390b8748a66fd5ce6c69"
        end
    end

    name "DeckCraft"
    desc "PowerPoint-style presentation builder"
    homepage "https://github.com/storytold/deckcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/deckcraft",
        "~/.local/share/deckcraft",
        "~/.cache/deckcraft",
    ]
end
