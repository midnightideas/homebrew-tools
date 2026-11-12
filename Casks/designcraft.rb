cask "designcraft" do
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.20.1/designcraft-0.20.1-macos-universal.dmg"
        sha256 "f45b2bf5543c1d8c37d09a971e99420d6ef3d97b6ebe33e31b36d2a3c39eb0c2"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.20.1/designcraft-0.20.1-linux-aarch64.AppImage"
            sha256 "14e6412cc8b15633571c0b09869b89f23ea2ac61b3e6819b3b26284e92b68693"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.20.1/designcraft-0.20.1-linux-x86_64.AppImage"
            sha256 "f9d6fd6bb1a421850243c0d4be44235713a9ec5b26f8bf1d5ba87afcf8f91534"
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
