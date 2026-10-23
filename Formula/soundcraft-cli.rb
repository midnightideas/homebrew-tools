class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.12.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.12.1/soundcraft-cli-0.12.1-macos-universal.zip"
        sha256 "fda1f1abb6998629f10449516ee705439a668c88dd8b7b28b41be54bad7732e5"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.12.1/soundcraft-0.12.1-linux-aarch64.tar.gz"
            sha256 "b16513d16be67a9715ec650db955ee6b41624db21fc182905ccaaa311547700d"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.12.1/soundcraft-0.12.1-linux-x86_64.tar.gz"
            sha256 "b0a56bd6b5d27de6b12e354580c362be6f59125ea58f573044c84f6a7da87780"
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
