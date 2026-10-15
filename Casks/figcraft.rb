cask "figcraft" do
    version "0.6.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.6.0/figcraft-0.6.0-macos-universal.dmg"
        sha256 "26385f23a95190458081c20efac0c1d86546b899ccbdabc7364f396dcacc7cc4"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.6.0/figcraft-0.6.0-linux-aarch64.AppImage"
            sha256 "8d4f6c2fccb128cee7d85c3ee85b0cfad3d6cf12c681e44cbd73ffd8cd50be28"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.6.0/figcraft-0.6.0-linux-x86_64.AppImage"
            sha256 "600f115ddc6d9e75f0720c0d9c5449c15b33fde276e080f013bb449ed1da4553"
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
