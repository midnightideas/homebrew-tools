class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-cli-0.8.0-macos-universal.zip"
        sha256 "41852f04159d64d62054a9d89b35fd9177eecdfdb53b5c8b52887d31dc4cef71"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "611f8474ef0403d71dfd41151d7a0363166c3eb970999f993ffed0c582a734f8"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "57a2b8776d51880cee69118568a396c09faca6949dcbf50f19879d71d596f5cc"
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
