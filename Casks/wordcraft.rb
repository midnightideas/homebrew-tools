cask "wordcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.14.0/wordcraft-0.14.0-macos-universal.dmg"
        sha256 "2c4026b17d027511a03afc4ac774c642c2b6276b6ff27e708c65fdf2894950ac"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.14.0/wordcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "eea41e91f2a2301469c68b4f58d1d0931846364cbab5e0b9b24ad896a7aed25f"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.14.0/wordcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "e7a2fee05ce862fe9147b6eb0ab6cda9e26caba7297168462800221e6663b25b"
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
