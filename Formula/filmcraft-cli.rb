class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.14.0/filmcraft-cli-0.14.0-macos-universal.zip"
        sha256 "c9dc8dfd9c63edb2f793f0727dc9816e4432ea545fa8cd7331d242944d843087"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.14.0/filmcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "b887277df634854968e9bb20b42a5bf34c35103040a1cae03a6c14dc406e60fe"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.14.0/filmcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "d2aa213cc08abd21e05ab511a78cc38f157caf2226992f3fc8a5e0496a3f7e7d"
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
