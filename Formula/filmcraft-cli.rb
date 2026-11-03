class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.17.0/filmcraft-cli-0.17.0-macos-universal.zip"
        sha256 "338a4042e235030af22d0a1039a4e463e325cf06a0970e1db6f0cb612a82b4d0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.0/filmcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "f1146274e49488ae8ab855c075e16e0bc47fe910c6291272e613df802cf1a853"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.0/filmcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "df3f8ab23481a28eefb7c9fd8d3899fbd94bb143e197068b4613fe050297bfbf"
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
