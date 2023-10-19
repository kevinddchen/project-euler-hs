FLAGS = -no-keep-hi-files -no-keep-o-files
SRC = ./src
BIN = ./bin
# automatically recognize binaries corresponding to `.hs` source files
TARGETS = $(patsubst $(SRC)/%.hs,$(BIN)/%,$(wildcard $(SRC)/p*.hs))

.PHONY: all clean

all: $(TARGETS)

$(BIN)/%: $(SRC)/%.hs
	@mkdir -p $(@D)
	ghc $< -o $@ $(FLAGS)

clean:
	rm -rf $(BIN)
