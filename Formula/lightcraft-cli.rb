class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    name "LightCraft CLI"
    version "0.7.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.7.1/lightcraft-cli-0.7.1-macos-universal.zip"
        sha256 "0b87e0d29bd828de9eab31a527d18f4702fdfd2db53fb594849c12d07e865758"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.7.1/lightcraft-0.7.1-linux-aarch64.tar.gz"
            sha256 "26de6212cd6a13d5d2ca758e0cf6b12b1bbf00b94834520992cee516481174a2"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.7.1/lightcraft-0.7.1-linux-x86_64.tar.gz"
            sha256 "842881f5ad16502df11eeef4c28e5dcf2c5d66b7d4d838af7179a3fd2e0cb6c0"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to lightcraft-cli-0.7.1-macos-universal/; install just the binary.
            bin.install "lightcraft-cli-0.7.1-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "lightcraft-0.7.1-linux-aarch64/bin/#{name}"
        else
            bin.install "lightcraft-0.7.1-linux-x86_64/bin/#{name}"
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
