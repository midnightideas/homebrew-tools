cask "figcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.15.0/figcraft-0.15.0-macos-universal.dmg"
        sha256 "7d0ea44bd587a9cb34ac786d0045cb8d73400fe38a9c108ae40327c865ed4e00"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.15.0/figcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "be158d0fc131d2b549d898f99f435afc64b84b390341f39a4ae6ac386b964485"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.15.0/figcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "47d0fde4fc2ba28d1e6cb484ae8f3134325f58458c0d8c289a411b8683e3217a"
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
