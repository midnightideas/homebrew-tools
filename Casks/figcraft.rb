cask "figcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.10.0/figcraft-0.10.0-macos-universal.dmg"
        sha256 "3c3f54cf75ad00f949b9782247165e653593e90f3f2f3fdd5bba8fb21b020cbf"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.10.0/figcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "d2b44173c8892e00935bfe215697bd0846b70cce201e08418f8b2db84cfc267b"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.10.0/figcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "28f8efe18779498e286ce93e9442058f0db17b4570e2cb92bf526c3e723484e9"
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
