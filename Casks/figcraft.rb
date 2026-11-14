cask "figcraft" do
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-0.18.1-macos-universal.dmg"
        sha256 "de7bc22fb363c57a350927f5ca009bd444b19993bdeb2863b564e99f3fbae230"
        app "FigCraft.app"
        zap trash: [
            "~/Library/Application Support/FigCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-0.18.1-linux-aarch64.AppImage"
            sha256 "8fdd9f7f9f0e38fdef7a7c9d30498451677f481a38e1d184b18a5df85799edf7"
            app_image "figcraft-0.18.1-linux-aarch64.AppImage", target: "FigCraft.AppImage"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-0.18.1-linux-x86_64.AppImage"
            sha256 "9586942dd631b96b4c5522988e9e80213907b8022ffafbca624a3fc11ae7a9e9"
            app_image "figcraft-0.18.1-linux-x86_64.AppImage", target: "FigCraft.AppImage"
        end
        zap trash: [
            "~/.config/FigCraft",
            "~/.local/share/applications/ai.storyteller.figcraft.desktop",
            "~/.local/share/icons/hicolor/*/apps/ai.storyteller.figcraft.*",
        ]
    end

    name "FigCraft"
    desc "Figma-style collaborative design and prototyping tool"
    homepage "https://github.com/storytold/figcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
