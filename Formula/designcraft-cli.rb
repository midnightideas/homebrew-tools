class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.15.2"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-cli-0.15.2-macos-universal.zip"
        sha256 "e8b9c5e960876a424c66b9981ede24efe06854353d2dd475cd61ef7bf0d6e648"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-0.15.2-linux-aarch64.tar.gz"
            sha256 "db4243825d53f496f92bd687605488f8d48aefa01ba73cef50dc87b791689dd0"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-0.15.2-linux-x86_64.tar.gz"
            sha256 "e7b782f7464977efe935ad68e3c908b0939f3b666070c88df2046198dc6e8944"
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
