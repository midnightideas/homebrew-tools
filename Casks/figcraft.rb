cask "figcraft" do
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.15.1/figcraft-0.15.1-macos-universal.dmg"
        sha256 "03778bd82b3b1fdf59bc4301cd45e453e1355a7841dd155d47df1694a19a89e3"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.15.1/figcraft-0.15.1-linux-aarch64.AppImage"
            sha256 "4d06ad75bc18532ca2fd7173561ae31241384ddeaef117d2729b5374e0b8de0d"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.15.1/figcraft-0.15.1-linux-x86_64.AppImage"
            sha256 "f70bc23eea74acda75902e15c6426a436d6644a08340e53d4b637874279f5b87"
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
