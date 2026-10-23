class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.13.0/lightcraft-cli-0.13.0-macos-universal.zip"
        sha256 "5c456eefc93558db123ed2203f60c7819fa8ed3607bf715404a71005f9342200"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.13.0/lightcraft-0.13.0-linux-aarch64.tar.gz"
            sha256 "5f47cb0e71d17d21c130aa06bf9c3e0895185c5501b94f14633a9de6a587ca48"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.13.0/lightcraft-0.13.0-linux-x86_64.tar.gz"
            sha256 "873c795e641ea8c345e02e4895f6c2659015e531420f68352ca3421aa9b8edcd"
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
