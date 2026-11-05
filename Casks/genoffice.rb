cask "genoffice" do
    version "0.12.852"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.852/GenOffice-0.12.852-arm64.dmg"
            sha256 "7724ead484688d4bc061dbdfdf1326340b7fb8101c796d2760b2baf63721f52b"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.852/GenOffice-0.12.852.dmg"
            sha256 "5b7404ac401e64592fb8d84cb54ec3282dcf0f61cd33b5d2855cebd2b9f32365"
        end
        app "GenOffice.app"
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.852/GenOffice-0.12.852.AppImage"
        sha256 "824e2d75f2eb5d1851dc502e9224c1d44b020dbcf626577473993b31d60c7fde"
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
