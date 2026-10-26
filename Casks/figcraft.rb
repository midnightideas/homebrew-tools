cask "figcraft" do
    version "0.11.2"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.11.2/figcraft-0.11.2-macos-universal.dmg"
        sha256 "2a626afa9c65ad96a3d1eaaf8ef5fca4654b8a6b000d1c8a3a4c1ccc7c4376bc"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.11.2/figcraft-0.11.2-linux-aarch64.AppImage"
            sha256 "d9743d61d1cfb262e93267984e111f643964e03c8289720a9fedc872f23ddda9"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.11.2/figcraft-0.11.2-linux-x86_64.AppImage"
            sha256 "dd92da8d9b3ec259f81cea3308b1b3961a0579b437ed7f55e8a0a58466a8a986"
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
