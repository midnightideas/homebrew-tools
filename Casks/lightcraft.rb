cask "lightcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-0.8.0-macos-universal.dmg"
        sha256 "92a98717dec992cd0349da2397f695219b1ec9a8a251e1c6f30e12c3d4168dcf"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "e2f982cd7b2ba1850f756ba2ee8997f611f0ad519b51e6b04434c3c512a1a05a"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "81d54b09e60b448c05517f1dea3422bea5998692a8a1a84060466385b9dfd9c3"
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
