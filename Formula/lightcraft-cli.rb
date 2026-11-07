class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-cli-0.19.0-macos-universal.zip"
        sha256 "2d6cb1b8f267e96e1544d4c2fe46808cfe1ca7f2153772a73cc62dff9f0030a1"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "5306502b4fb5835fa167cfc42113dd6816149c247aabb5bc06df87715b9482df"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "9485d64bdbe98c6dafbad0ea7aac0fa49430d0a008b9a66ba43dfe77b7555289"
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
