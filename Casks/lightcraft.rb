cask "lightcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.18.0/lightcraft-0.18.0-macos-universal.dmg"
        sha256 "f3cb326a202a2d6f89bd2d08ccd8b108e8efe103bb9da88c2a38e52a29f93e5a"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.0/lightcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "ad513f25b43ba55b6c67ab9daf3f3bb90f8eaca43f30d4c3745bc299246236d5"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.0/lightcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "f71606e446ff32cae9cdd050c51dd60202a97c116658f026ace6934a1d028b76"
        end
    end

    name "LightCraft"
    desc "Lightroom-style photo library and raw development"
    homepage "https://github.com/storytold/lightcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/lightcraft",
        "~/.local/share/lightcraft",
        "~/.cache/lightcraft",
    ]
end
