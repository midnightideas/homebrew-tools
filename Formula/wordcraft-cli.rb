class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-cli-0.15.0-macos-universal.zip"
        sha256 "92feb2a4e970b614bd8c70c2bbab02a1d621bcf4c72ea2ad8744f905fdf87ad8"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "1a60f0a1a6e569bea37014157deac0c404e9fa580df7dd66599bc886928b9a06"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "baacf18158124abc3d45dc4485bfc77a5d717f80ac50b80693b6501c26698e5d"
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
