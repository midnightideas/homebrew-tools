class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.8.0/filmcraft-cli-0.8.0-macos-universal.zip"
        sha256 "54cb2d572c24cd5e32a54bedd8fdd15df86eaa66bf188a75c2de81fbd99ed90d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.8.0/filmcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "1afe2ac3c6013b7c36eedd1bfbdeafc173ce5d470a35f1ddfe7e1faac503c0e6"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.8.0/filmcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "b166877905ae8a1b5505066d6dde60d7ce05831cfb309bacd5d7970f4bb017e1"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to filmcraft-cli-0.8.0-macos-universal/; install just the binary.
            bin.install "filmcraft-cli-0.8.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "filmcraft-0.8.0-linux-aarch64/bin/#{name}"
        else
            bin.install "filmcraft-0.8.0-linux-x86_64/bin/#{name}"
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
