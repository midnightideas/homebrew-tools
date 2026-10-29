cask "figcraft" do
    version "0.12.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.12.1/figcraft-0.12.1-macos-universal.dmg"
        sha256 "e843212fb1b4c6ed565bcf954dce7ac5ca6038daa430f58e232e628045e841f9"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.12.1/figcraft-0.12.1-linux-aarch64.AppImage"
            sha256 "376bfefe6e596775287ca29df1e437d43891d954559a5b6ed372e60cf28ffa60"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.12.1/figcraft-0.12.1-linux-x86_64.AppImage"
            sha256 "c52be046d7bea73790f3584ffca6ec7935df229adce8f8e483b03242ee2aab1f"
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
