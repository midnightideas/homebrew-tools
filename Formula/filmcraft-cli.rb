class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-cli-0.18.0-macos-universal.zip"
        sha256 "21d2da36d57cb311dd3b73db17213d3167d5a9110b68d00c2e2bd0585fd50395"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "c9bb8ddbf764ac583cdcacf685a578e621b58c21d001a93b941a6e8257082eab"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "0179f05b20db855bfd3def9136ce60dee59f22d2dcbfcf23e4a6256e0c153b05"
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
