class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.18.1/lightcraft-cli-0.18.1-macos-universal.zip"
        sha256 "519b9dcaef272a0472604f333acb40a4380df731ef810e738e42f099e3a868b9"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.1/lightcraft-0.18.1-linux-aarch64.tar.gz"
            sha256 "9fdb661b64d8449b0f98b1677683eb4b33049896488bfd273c15406cead11657"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.1/lightcraft-0.18.1-linux-x86_64.tar.gz"
            sha256 "078f8e4fef6ca88afa257a70228630b14e21380cea58031fbb5c5a1942b406f0"
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
