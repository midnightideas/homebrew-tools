cask "figcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.8.0/figcraft-0.8.0-macos-universal.dmg"
        sha256 "4f5cadd60cd4d6512ec1144f9c3aaffc71ea2a29c20d87d51bad79d087aff7c1"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.8.0/figcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "cf23a9da7642dd64acd7970a428fccd50e1015664ea1e19b5dc9368bc97cce94"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.8.0/figcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "ecf1cf8ee60a150da4a655252ca17fefce725e2d44027db36a60994319927bf2"
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
