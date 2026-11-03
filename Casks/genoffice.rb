cask "genoffice" do
    version "0.12.600"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.600/GenOffice-0.12.600-arm64.dmg"
            sha256 "a0f3e688112b72ddaea49fcceda725b54861342d82f8f5d628b949c90ab58baa"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.600/GenOffice-0.12.600.dmg"
            sha256 "9ff61458c58fa0f98c239db5f3bc0022a50a10d9f62f213e4403d88f78582e07"
        end
        app "GenOffice.app"
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.600/GenOffice-0.12.600.AppImage"
        sha256 "b1923333a4a1ebddc70635dfff888d0600461b17a87071711b1ee757364e58c9"
    end

    name "GenOffice"
    desc "Open-source AI office suite for docs, sheets, slides, and PDF"
    homepage "https://genoffice.ai/"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/Library/Application Support/GenOffice",
        "~/Library/Caches/GenOffice",
        "~/Library/Logs/GenOffice",
        "~/Library/Preferences/com.genoffice.app.plist",
        "~/.config/GenOffice",
        "~/.cache/GenOffice",
        "~/.genoffice",
    ]
end
