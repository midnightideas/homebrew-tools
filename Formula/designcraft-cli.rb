class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.21.1/designcraft-cli-0.21.1-macos-universal.zip"
        sha256 "8148a42e293ba9a83351568ad938410b8868495952679648f7018ad5cd245cf3"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.21.1/designcraft-0.21.1-linux-aarch64.tar.gz"
            sha256 "0accf303da25b0e1ad2b00a4d812de9207a45fec236c19421d9a404c9d291dd6"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.21.1/designcraft-0.21.1-linux-x86_64.tar.gz"
            sha256 "211e74b9f5cee5bfc3cdb46983d0bdb1fdbd09164bfd807f4ff70706935d40ae"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
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
