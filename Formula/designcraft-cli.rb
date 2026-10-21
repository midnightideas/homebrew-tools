class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.10.0/designcraft-cli-0.10.0-macos-universal.zip"
        sha256 "0a88351d7f82f71f8c11e1c3464a1225ad9cd48554191a6411b93e723ff0285e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.10.0/designcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "a232ffcd89c840bdcccfc4911efa43a6211c26d39a341a91c075093597439bd4"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.10.0/designcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "4a3708fa878daf5188aa2ba66fd7cd186bf38690a6c15246ec83d853e0deeb94"
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
