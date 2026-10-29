class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.15.0/lightcraft-cli-0.15.0-macos-universal.zip"
        sha256 "6640a8c7296fe1b3bd443593a17d96c42f549da9df5eb6598c5260455d17f85c"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.15.0/lightcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "3821538bfd8a23b2a5e824c4762d46b23a5f8f06f6e0a6c6dbd329accb49cd62"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.15.0/lightcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "0b1acdefc085babb334b9add290dd1a69b50e96efbdad2ec15d44bd6d64bfd3d"
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
