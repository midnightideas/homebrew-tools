class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.6.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.6.0/figcraft-cli-0.6.0-macos-universal.zip"
        sha256 "119446cc8f50b719dad7a73e0356de6194aa262b6520b362dfe310ee9f05b3be"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.6.0/figcraft-0.6.0-linux-aarch64.tar.gz"
            sha256 "1bb4c2364c8ac5133b52db14f6a1314d5802df1e0ee87e8fb8893ae7d5b635cb"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.6.0/figcraft-0.6.0-linux-x86_64.tar.gz"
            sha256 "b66dfa68fa5ee54e275f9270168974d54cdbe8b1f431c8b0e962cb7b6baa0660"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to figcraft-cli-0.6.0-macos-universal/; install just the binary.
            bin.install "figcraft-cli-0.6.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "figcraft-0.6.0-linux-aarch64/bin/#{name}"
        else
            bin.install "figcraft-0.6.0-linux-x86_64/bin/#{name}"
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
