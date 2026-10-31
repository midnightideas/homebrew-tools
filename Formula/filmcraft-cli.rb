class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-cli-0.15.0-macos-universal.zip"
        sha256 "e34e2356ff7629b67f2aee092d7a1b7ea5e649f54354d2804909e33e67777512"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "2cb66b8fe26f0038f3cd78532b951b6625fef162f84b8564289679bbbdce1429"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "22b106b4ca6294d9b3e9a4af40b40a653a1897437364805046a01ddbaa4b22c1"
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
