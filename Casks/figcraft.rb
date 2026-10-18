cask "figcraft" do
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-0.7.0-macos-universal.dmg"
        sha256 "161283ed574f078ee2a2249c3d07e059bc88e4881c2e08217b57df1eed60225d"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-0.7.0-linux-aarch64.AppImage"
            sha256 "a4a9481bc37980b542267f87bd06640d2b419904982b5e65ebc0830e382ccba4"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-0.7.0-linux-x86_64.AppImage"
            sha256 "33e26f9952e6f66e907256c56619a8f75ebc2a61fc3c78fc3396dae210bd3c85"
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
