class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-cli-0.14.0-macos-universal.zip"
        sha256 "929fd47f2f03e587caa4090f1d13ec5c0e0ead20bc61005442fcb11da21966b1"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "17849e8fee7fa6655e02ef071e27f7bdb7edd0019172cd2e8e3523204cab0535"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "0ea489ce299238af96106940cddb42091c3eba109c05fdf843b4e7f8eb970829"
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
