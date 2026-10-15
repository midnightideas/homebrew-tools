class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-cli-0.8.0-macos-universal.zip"
        sha256 "e6734be20cb0cfc714d872b37a33c9c945c5a09f22f4c441c09facef8fcbbce0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "ce563498ee01c16ba94520c823123e18c2e6d846edc58e7d1a0475828181c1c3"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "9fe0ecc69b7f1f3a35a1c630429b3c52fdb4419ba208b5579b4501b938f518d1"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to lightcraft-cli-0.8.0-macos-universal/; install just the binary.
            bin.install "lightcraft-cli-0.8.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "lightcraft-0.8.0-linux-aarch64/bin/#{name}"
        else
            bin.install "lightcraft-0.8.0-linux-x86_64/bin/#{name}"
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
