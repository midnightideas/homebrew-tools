class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.10.0/filmcraft-cli-0.10.0-macos-universal.zip"
        sha256 "e5fc1c292ef8a768f2557845163bb930aa8a292e9f3b942f3c36b44b60806a72"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.10.0/filmcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "29b2d805723947bad7e36b020f43b39bbc9ba849cd3bfaff04ec2c0ac4a79070"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.10.0/filmcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "95d7a1afcb9e2021d3371a011700af6ce2ffe1af0e1cfe99c6fb98b3aa320f80"
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
