class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-cli-0.13.1-macos-universal.zip"
        sha256 "38ff4b43b8738eb503baf7895436043b85d2ae6733fa10a899991d2fe5ce9a7f"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-linux-aarch64.tar.gz"
            sha256 "14c6a5a782b5eebb356a232d9ea5a5a013f19c92c4f37056efbbfcecdbd0d935"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-linux-x86_64.tar.gz"
            sha256 "865cf29c75a737cd859d93fa48e9d4aa8dc6023f258aa127e88b97d887f90d27"
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
