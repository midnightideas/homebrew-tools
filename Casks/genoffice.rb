cask "genoffice" do
    version "0.13.886"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.886/GenOffice-0.13.886-arm64.dmg"
            sha256 "e9b3ca84391547c39c4283bd82c8e45f3cfd284f62c5dd51df04d27eab791c72"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.886/GenOffice-0.13.886.dmg"
            sha256 "8d141547e082979449b8ea0e2044f23074ae15335b4ab1d0ff15281923c6f3e9"
        end
        app "GenOffice.app"
        zap trash: [
            "~/Library/Application Support/GenOffice",
            "~/Library/Caches/GenOffice",
            "~/Library/Preferences/com.genoffice.app.plist",
        ]
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.886/GenOffice-0.13.886.AppImage"
        sha256 "e2a15b38813793538987de94b5a450f017c6f08b21a46b8e38eb2ffdced0c5e3"
        app_image "GenOffice-0.13.886.AppImage", target: "GenOffice.AppImage"
        zap trash: [
            "~/.config/GenOffice",
            "~/.cache/GenOffice",
        ]
    end

    name "GenOffice"
    desc "Open-source AI office suite for docs, sheets, slides, and PDF"
    homepage "https://genoffice.ai/"

    livecheck do
        url :url
        strategy :github_latest
    end
end
