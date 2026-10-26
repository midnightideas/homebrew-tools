cask "photocraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.16.0/photocraft-0.16.0-macos-universal.dmg"
        sha256 "489e00a7fd19f7e924a3a05ec33c7b057ea4766129b4eef132ce82ff42c10619"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.16.0/photocraft-0.16.0-linux-aarch64.AppImage"
            sha256 "dde10fe1311e66bb0f82ae8ad237e112716ebd0daed483243a1e12f2bc33f853"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.16.0/photocraft-0.16.0-linux-x86_64.AppImage"
            sha256 "fc670139091e661e948a6de1ff2219a6dd04232e6ac8616349ee238a7a49d54e"
        end
    end

    name "PhotoCraft"
    desc "Photoshop-style raster image editor"
    homepage "https://github.com/storytold/photocraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/photocraft",
        "~/.local/share/photocraft",
        "~/.cache/photocraft",
    ]
end
