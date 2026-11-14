cask "filmcraft" do
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.20.1/filmcraft-0.20.1-macos-universal.dmg"
        sha256 "5722f0f21ca96583ee27dfd88bae23e0a4a6ab87862a6c00082c88c5c759e75e"
        app "FilmCraft.app"
        zap trash: [
            "~/Library/Application Support/FilmCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.20.1/filmcraft-0.20.1-linux-aarch64.AppImage"
            sha256 "487c1750281285de67f68752e1154332b08993c95aee2b4271e4164ec3c33365"
            app_image "filmcraft-0.20.1-linux-aarch64.AppImage", target: "FilmCraft.AppImage"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.20.1/filmcraft-0.20.1-linux-x86_64.AppImage"
            sha256 "4a25aecb2e9481b65e7353528bca9e4a8c5388dd55f1486ffe64502e08bdfa02"
            app_image "filmcraft-0.20.1-linux-x86_64.AppImage", target: "FilmCraft.AppImage"
        end
        zap trash: [
            "~/.local/share/filmcraft",
        ]
    end

    name "FilmCraft"
    desc "Premiere-style non-linear video editor"
    homepage "https://github.com/storytold/filmcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
