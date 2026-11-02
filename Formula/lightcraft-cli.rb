class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.17.0/lightcraft-cli-0.17.0-macos-universal.zip"
        sha256 "79e111ca32152b869a285bfe3c05548a97132f8c5e1f711f41e0083200a96590"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.17.0/lightcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "6c298e68616bb71a1a18f6fad11ff2929f60ca7844aaf6cb2d5aa4db195c5203"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.17.0/lightcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "d187f5a1592d4866220c4d127d6e5a3da4ffa7c966cc87df8f49e735c07cf2c1"
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
