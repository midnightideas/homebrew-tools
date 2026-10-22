class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.11.0/soundcraft-cli-0.11.0-macos-universal.zip"
        sha256 "6868fec480ea7d10638f277ebc8eb2fd6097b12b064a127f493d0522140eea01"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.11.0/soundcraft-0.11.0-linux-aarch64.tar.gz"
            sha256 "470dbf417913bb063d9022848b1cb14444bd4b1d8179ee74c736d555e8ff3f7e"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.11.0/soundcraft-0.11.0-linux-x86_64.tar.gz"
            sha256 "3f4b0368310f10400439b4da304862a7d463231cfc51d6057e1146962a2ffa35"
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
