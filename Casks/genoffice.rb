cask "genoffice" do
    version "0.13.18"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.18/GenOffice-0.13.18-arm64.dmg"
            sha256 "693c690caa50082700520e86f3690af9f35d123f7546ce328e2202b82b8f6b2f"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.18/GenOffice-0.13.18.dmg"
            sha256 "f157deb95ad15bd1808792f7ce75167697bce53a04f9378432cac0465bbbf605"
        end
        app "GenOffice.app"
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.18/GenOffice-0.13.18.AppImage"
        sha256 "edd687d50edcaee44b1b30c35feb671a313401cb6df26963e5897b99228d1871"
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
