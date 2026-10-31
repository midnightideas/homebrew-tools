class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-cli-0.16.0-macos-universal.zip"
        sha256 "64f127f132a1a59074d3d4746cfbd265ed4ad30abc6fa74f15fa3591cce5dc3e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "7596a3a78edcb262f26f1abe7794134e820249e13ecb9e0e0c9a1c250687046b"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "d22edf5ac40100291d8c3d8dde8bf1c91cae21a0b56d4ca9cc0026db3139a926"
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
