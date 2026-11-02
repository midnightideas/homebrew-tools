cask "cadcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.16.0/cadcraft-0.16.0-macos-universal.dmg"
        sha256 "cb7f871731e495cefec003a412550c12ef67a1510f61e45f7dffa7edfe805bbe"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.16.0/cadcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "0d168dc1e7a38dd3843e77cb77fb06fee2ff308838e2d7f91172afb947c5e7fc"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.16.0/cadcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "0746fce592f8e6edfcce411590ae8e10f2f6846b35f765e63bb1071ee8c8eea8"
        end
    end

    name "CADCraft"
    desc "AutoCAD-style 2D/3D CAD application"
    homepage "https://github.com/storytold/cadcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/cadcraft",
        "~/.local/share/cadcraft",
        "~/.cache/cadcraft",
    ]
end
