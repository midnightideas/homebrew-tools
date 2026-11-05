cask "filmcraft" do
    version "0.17.1"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.17.1/filmcraft-0.17.1-macos-universal.dmg"
        sha256 "ca01efef41f1e57bb5a19d70c5f94e64dd3a35d65152c54d127f8a8f701a241d"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.1/filmcraft-0.17.1-linux-aarch64.AppImage"
            sha256 "2e1de3e773203e20c11faaafd67f590c04471545154443e5c0c41769d4a6b45f"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.1/filmcraft-0.17.1-linux-x86_64.AppImage"
            sha256 "0f524975bc54c9177ac806dbcb9cbe1d9f7bfb189fa5f6cb49f5672246377e2f"
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
