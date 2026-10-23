class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.12.0/filmcraft-cli-0.12.0-macos-universal.zip"
        sha256 "04f4001afaef16b31f245696808a0393f28d4569e7eda3ee324ae30bf7906310"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.12.0/filmcraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "83714c4a73774a3f54a3d2bf52ae0065d3fb8ca8c781deb7cb3450f9b4e74568"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.12.0/filmcraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "ddff0a2ec0d89e5e9e65644ed724b5b79959600b1602fd4ea6653b5a54bf88fd"
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
