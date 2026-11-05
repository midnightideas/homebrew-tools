class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.17.2"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.17.2/designcraft-cli-0.17.2-macos-universal.zip"
        sha256 "3d3b0ad3cda23344dbfba5f08a46dbfc81a02477dc644ca2b1266dee23198372"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.17.2/designcraft-0.17.2-linux-aarch64.tar.gz"
            sha256 "326b493e680538423fe62fcfd1b74915c36d6afa96fb500b108335a7403b383c"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.17.2/designcraft-0.17.2-linux-x86_64.tar.gz"
            sha256 "b92e9067db11b8de1bb348232c0955d32469366fa3952d5dd96c18ca180a28ce"
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
