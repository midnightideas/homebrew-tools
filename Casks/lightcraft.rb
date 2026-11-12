cask "lightcraft" do
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.21.1/lightcraft-0.21.1-macos-universal.dmg"
        sha256 "b70f46cac01390154c9adfa06822e6691b95fc270c507b0ed220a00dc588bb1e"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.21.1/lightcraft-0.21.1-linux-aarch64.AppImage"
            sha256 "b446816baa6bc41501e9e705c6e757a859bc103a6348aec13e838cb376dc6e22"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.21.1/lightcraft-0.21.1-linux-x86_64.AppImage"
            sha256 "c4212da22777a0000d9eb66c85b7865e9e9911f47a60207d7852b7c063ada8a9"
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
