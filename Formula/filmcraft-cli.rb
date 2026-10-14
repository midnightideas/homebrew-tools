class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    name "FilmCraft CLI"
    version "0.7.2"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.7.2/filmcraft-cli-0.7.2-macos-universal.zip"
        sha256 "1edb5ba5391bd7439ebd0cda059f81d1a6e0327be59aeb91a5a532b1ee1a287e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.7.2/filmcraft-0.7.2-linux-aarch64.tar.gz"
            sha256 "4af56f649a6fb19dcae386abd59921ec6c9190b725014517075fa4d81123c68a"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.7.2/filmcraft-0.7.2-linux-x86_64.tar.gz"
            sha256 "4171c4bf5f57fd29475655f8a6df4719feda8c8f3ed95b2475d8dc112ad3be86"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to filmcraft-cli-0.7.2-macos-universal/; install just the binary.
            bin.install "filmcraft-cli-0.7.2-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "filmcraft-0.7.2-linux-aarch64/bin/#{name}"
        else
            bin.install "filmcraft-0.7.2-linux-x86_64/bin/#{name}"
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
