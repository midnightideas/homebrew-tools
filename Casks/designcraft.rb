cask "designcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.19.0/designcraft-0.19.0-macos-universal.dmg"
        sha256 "39f2a45f825416c46a0328cd26003a86b8f0963feca36c446bfb20e0b8190b78"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.19.0/designcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "79a7018c2ea13ee75ef486eba7ab26eb5e8cda87ee9f93bed79749a98ae9a54b"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.19.0/designcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "e8220d7e417790e1528dc84d4db5fb2293dd0327e62ee29f8ca03f092801e9a5"
        end
    end

    name "DesignCraft"
    desc "InDesign-style page layout application"
    homepage "https://github.com/storytold/designcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/designcraft",
        "~/.local/share/designcraft",
        "~/.cache/designcraft",
    ]
end
