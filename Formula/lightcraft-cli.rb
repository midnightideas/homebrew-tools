class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.14.0/lightcraft-cli-0.14.0-macos-universal.zip"
        sha256 "2beab881145ca4d88e725fdb358b2cf5ef0c081e893fb0a2c16a06bea6412064"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.14.0/lightcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "eba0b3ca3704b7023fc485897443ecaaf40b378540a9921f59c9ca74f2f8cfe0"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.14.0/lightcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "b8233b9373d6e99b1180c1c39fdcb13d49c441f80092770831fab195c4c4fda2"
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
