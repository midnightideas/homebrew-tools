cask "filmcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.17.0/filmcraft-0.17.0-macos-universal.dmg"
        sha256 "59558fbe4eb4489591c0cb232c97b88b9120e624de01c26d82de10c1576f2ab3"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.0/filmcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "5b5bd1de3e82401f5c51cf52402a0c8724c1ec4e9270c382c852dbc6764d8871"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.0/filmcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "766f9c564f7ce128e484fb2b838c625f7381469745cfd3c66912ddc80136bee3"
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
