class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.20.1/filmcraft-cli-0.20.1-macos-universal.zip"
        sha256 "1651d9defb54f853cbd69016428bb9f72a7bf26d56e4755b8e2a79535fd0ac82"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.20.1/filmcraft-0.20.1-linux-aarch64.tar.gz"
            sha256 "cdce3d832620c7cf7150e6609fd98ad9702e7d4c57f827aab562e87d816ea13f"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.20.1/filmcraft-0.20.1-linux-x86_64.tar.gz"
            sha256 "3e4fea3cb8d473e68f189a0a8792ba46160fab507adab3ab8920073fd41f24fa"
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
