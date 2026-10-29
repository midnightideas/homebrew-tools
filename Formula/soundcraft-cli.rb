class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.14.0/soundcraft-cli-0.14.0-macos-universal.zip"
        sha256 "104e5674cf741e3579166b84fd7a687332f0de885165f50a05e46cc502660b75"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.14.0/soundcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "912ef157833753c5ec87c79fe76ef42a7f68c746fd117882cbc2c8d6e1eb357d"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.14.0/soundcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "2f83503feda6aa2c8d4bc12c44f571422c4389fc664a92bbed092d2bf1d500ad"
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
