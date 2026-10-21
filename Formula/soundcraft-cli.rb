class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-cli-0.10.0-macos-universal.zip"
        sha256 "1b82c7ec17677df33cef2df7f226321796b6def6c10d9ef8ffd953adf9ede5bf"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "fc5fbcabb6ccbfa9e13d64591332af6939242a29cc62dbc551d02054aa712f88"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "46418d56fefcdacd286e6a696fb523f57f545d5f141c46fc72ba73738b6b6c70"
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
