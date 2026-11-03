class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.17.0/soundcraft-cli-0.17.0-macos-universal.zip"
        sha256 "646428febf39eb4f48059c9e32f3e42efa58dfaf15f1a9abb4634bb54a655868"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.0/soundcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "6188c76afd0434fe032fdc458eeaa9e88d5c286f5d03cfc3507e372030102ae6"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.0/soundcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "309bfecbb3044c16f0a200d64b58b341834089fa78211f722afb50eb05566d71"
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
