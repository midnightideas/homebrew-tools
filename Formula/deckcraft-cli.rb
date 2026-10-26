class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.11.1/deckcraft-cli-0.11.1-macos-universal.zip"
        sha256 "02ef9ea0600499b36036a4a4426f6903e86a24748705c72e8c8ad73da03a1ab6"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.11.1/deckcraft-0.11.1-linux-aarch64.tar.gz"
            sha256 "16c6a05587aca978a9a75569f19ca60ceaf94215fa42219a8d2781e356c8b865"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.11.1/deckcraft-0.11.1-linux-x86_64.tar.gz"
            sha256 "7bf57a10a4fcf7673ecb669b64e0e545475780ef3e4ee6bf603aeb00f544e69c"
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
