cask "figcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.17.0/figcraft-0.17.0-macos-universal.dmg"
        sha256 "59bd526225f16bb6afd34c2ac3bb88079169122f6a4506181d606910263c798b"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.17.0/figcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "0f4dbc66c76ac2aaaad8e92ef4586fc79485e540fdf663a4baa067888e7872f7"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.17.0/figcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "a749d9f8074cbd2dc7d04a16d47262001a2528391fa153bd6c5c4e4f84c8e414"
        end
    end

    name "FigCraft"
    desc "Figma-style collaborative design and prototyping tool"
    homepage "https://github.com/storytold/figcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/figcraft",
        "~/.local/share/figcraft",
        "~/.cache/figcraft",
    ]
end
