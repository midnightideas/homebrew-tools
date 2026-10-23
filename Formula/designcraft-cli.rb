class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.12.0/designcraft-cli-0.12.0-macos-universal.zip"
        sha256 "3a8ebebf03ded56a5b5128f80ec7859351adad94fd8964fd7991acf648a0cd7c"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.12.0/designcraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "eb055f655ab26a137d5e46d63c6d7d91683148814766224a36de73ecbff7a6b3"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.12.0/designcraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "0e7bbe349670f8d5eb178fa9bd4a1bf1c7c51d6a54e1b802b8dcdbb2ae68fe1d"
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
