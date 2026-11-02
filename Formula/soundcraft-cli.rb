class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-cli-0.16.0-macos-universal.zip"
        sha256 "9b45a444be1f5733a101ea592c01dea92c259508fab69b66053cac1aac5ae54b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "a691a399929e9a3d2a39c210704554887bc46d07b5de68474e46f5abc2089577"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "25c6b0cb8924198f22e3a6f2771d7dcc9e041a3244a4be445cbde9d00e7dc19e"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
        elsif Hardware::CPU.arm?
            bin.install "bin/#{name}"
        else
            bin.install "bin/#{name}"
        end
    end

    test do
        assert_predicate bin/"#{name}", :exist?
    end

    livecheck do
        url :url
        strategy :github_latest
    end
end
